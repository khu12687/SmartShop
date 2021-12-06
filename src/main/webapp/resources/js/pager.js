const state = { //전역변수로 선언 ->  검색 데이터 내부에서 pagination 가능, 현재 페이지에 관련된 모든 상태를 저장하는 객체
    page: 1
};

const header = [];

function makeItem(item) { //item = ajax을 통해 얻는 result와 list
    // const {code, name, spec, category, manufacture, price, barcode} = item;

    let html = `<tr class="item" data-code="${item[pager_key]}"><td><input type="checkbox" class="item-check" value="${item[pager_key]}"></td>`;

    for(let i=0; i < header.length; i++) {
        let value_ = "";

        if(item[header[i]])
            value_ = item[header[i]];

        html += `<td class="${header[i]}">${value_}</td>`;
    }



    // <td class="code">${code}</td><td class="barcode">${barcode_}</td><td class="name">${name}</td><td class="spec">${spec}</td><td class="category">${category}</td><td class="manufacture">${manufacture}</td><td class="price">${price}</td>


    html += `<td><div class="btn btn-warning btn-sm update">변경</div> <div class="btn btn-danger btn-sm delete">삭제</div></td></tr>`;

    return html;
}

// =======================[시작] select =======================
function movePage(page) {
    state.page = page;
    
    $.ajax(pager_url, {
        method: "GET",
        contentType: "application/json", //서버에 보낼 데이터의 형태 지정
        dataType: "json",
        data: state,
        success: result => {
            const {list, pager} = result; //disconstructuring: 서버에서 보낸 hashmap컬렉션의 list, pager key를 result 배열에 저장 
            
            $(`${pager_root} thead input[type='checkbox']`).prop("checked", false);

            $(`${pager_root} th i`).remove();
            if(pager.orderMode != 0) {
                const icon = $("<i>")

                if(pager.orderMode == 1)
                    icon.addClass("bi bi-caret-up");
                else
                    icon.addClass("bi bi-caret-down");

                $(`${pager_root} th[data-order='${pager.order}']`).prepend(icon);
            }

            $("#search .perPage").val(pager.perPage); //pager 객체의 perPage 값 수정을 통해 기본 출력 개수 설정 가능

            state.total = pager.total;
            $("#total").text(state.total);
    
            if(list && list.length > 0) {
                $(`${pager_root} .empty_msg`).addClass("hide");
    
                const tbody  = $(`${pager_root} tbody`);
                
                let html = "";
                for(let i=0; i < list.length; i++)
                    html += makeItem(list[i]);
 

                $(`${pager_root} tr.item`).remove();
                
                tbody.append(html);
                // $(`${pager_root}`).append(tbody);
                    
            } else {
                $(`${pager_root} .empty_msg`).removeClass("hide");
                $(`${pager_root} tr.item`).remove();
            }

            $(`${pager_root} .page-prev`).data("page", pager.prev);
            $(`${pager_root} .page-next`).data("page", pager.next);
            $(`${pager_root} .page-last`).data("page", pager.last);
            $(`${pager_root} .page-list`).remove();
                 
                const pageList = pager.list;
                for(let i=0; i < pageList.length; i++) {
                    const page_item = $("<div>").addClass('page-item page-list');

                    if(pager.page == pageList[i])
                        page_item.addClass("active");

                    const page_link = $("<div>").addClass("page-link");
                    page_link.text(pageList[i]);
                    page_link.attr("data-page", pageList[i]);

                    page_item.append(page_link);

                    $(`${pager_root} .page-next`).parent().before(page_item);
                } 

        },
        error: xhr => alert(`오류 발생: ${xhr.statusText}`)
    })
}
// =======================[끝] select =======================

function search() {
    const search = $("#search .search").val();
    const keyword = $("#search .keyword").val();

    if(search != 0 && keyword == "") {
        alert("검색어를 입력해주세요");
        $("#search .keyword").focus();
        return;
    }

    state.search = search;
    state.keyword = keyword;

    movePage(1);
}


// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@$(function) @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

$(function() {
    $("#delete_list").click(function() {
        const list = $(`${pager_root} .item-check:checked`).get();

        const selected = list.map(item => item.value);

        $.ajax(`${pager_url}/delete/list`, {
            method: "POST",
            contentType: "application/json",
            dataType: "json",
            data: JSON.stringify(selected), 
            success: () => movePage(1),
            error: xhr => alert(`오류 발생: ${xhr.statusText}`)
        })


    })

    $(`${pager_root} thead input[type='checkbox']`).on("change", function() {
        const checked = $(this).prop("checked");

        $(`${pager_root} .item-check`).prop("checked", checked);

    })

    //header[]에 기능별 칼럼명을 저장 -> 필요할 때 사용
    $(`${pager_root} th.order`).each( (index, item) => {
        header.push( $(item).data("name") );
    });

	$(`${pager_root} th.order`).click(function() {
		//order: 정렬 기준, orderMode: asc, desc, 정렬 안함
        if(state.order == $(this).data("order")) 
            state.orderMode = ++state.orderMode % 3;
        else {
            state.order = $(this).data("order");
            state.orderMode = 1;
        }

        movePage(1);
	});
	
    $("#search .perPage").on("change", function() {
        state.perPage = $(this).val();

        movePage(1);
    });
    
    $("#search .keyword").on("keypress", function(event) {
        if(event.keyCode == 13) {
            search();
        }
    });

    // =======================[시작] search =======================
    $("#search .search").on("change", function() {
        if($(this).val() == 0) {
            $("#search .keyword").val("");
            search();
        }
    })

    $("#search .submit").click(function() {
       search();
    })
    // =======================[끝] search =======================


    // =======================[시작] update =======================
    $(`${pager_root}`).on("click", ".update", function() {
        header.forEach(value => {
            const text = $(this).parent().siblings(`.${value}`).text();
            $(`#updateModal .${value}`).val(text);
        })

        $("#updateModal").modal("show");
    });

    $("#updateModal .update").click(function() {
        const item = {};
        header.forEach(value => item[value] = $(`#updateModal .${value}`).val());

        $("#updateModal input").val("");
        $("#updateModal").modal("hide");
        
        $.ajax(pager_url, {
            method: "PUT",
            contentType: "application/json",
            dataType: "json",
            data: JSON.stringify(item), //ajax은 데이터를 문자열로 변환해주지 않음 -> java객체에서 데이터를 사용하기 위해서 stringify()
            success: function(result) {
                for(prop in result) {
                    $(`tr[data-code='${item.code}'] .${prop}`).text( result[prop] );
                }
            },
            error: xhr => alert(`오류 발생: ${xhr.statusText}`)
        });
        
    });
    // =======================[끝] update =======================

    // =======================[시작] delete =======================
    $(`${pager_root}`).on("click", ".delete", function() {
       const code = $(this).parent().parent().data("code");

       $.ajax(`${pager_url}/delete/list`, {
           method: "POST",
           contentType: "application/json",
           dataType: "json",
           data: JSON.stringify(selected), 
           success: result => {
               $(`tr[data-code='${code}']`).remove()

               $("#total").text(--state.total);
           },
           error: xhr => alert(`오류 발생: ${xhr.statusText}`)

       })
    });
    // =======================[끝] delete =======================

    // =======================[시작] add =======================
    $("#addModal .add").click(function() {
        const item = {};
            header.forEach(value => item[value] = $(`#addModal .${value}`).val())          

		$("#addModal input").val("");

        $.ajax(pager_url, {
            method: "POST",
            contentType: "application/json",
            dataType: "json",
            data: JSON.stringify(item),
            success: function(result) {
                const html = makeItem(result);

                $(`${pager_root} tbody`).prepend(html);

               $("#total").text(++state.total);
            }, 
            error: xhr => alert(`오류 발생: ${xhr.statusText}`)
        })

        $("#addModal").modal("hide");
    })
    // =======================[끝] add =======================

    $(`${pager_root}`).on("click", ".page-link", function() {
        
        const page = $(this).data("page");
        
        movePage(page);
    })

    movePage(1);
})

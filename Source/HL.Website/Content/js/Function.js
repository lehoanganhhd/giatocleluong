/*===========================*/
/* Su dung ajax goi function */
/*===========================*/
function getNodeValue(o) {
    try {
        return o.item(0).firstChild.nodeValue;
    }
    catch (err) {
        return '';
    }
}

function getDataPhaHe() {
    var ranNum = Math.floor(Math.random() * 999999);
    sLink = '/Tools/Ajax.aspx?cmd=getDataPhaHe&rnd=' + ranNum;
    AjaxRequest.get(
        {
            'url': sLink,
            'onSuccess': function (req) {
                with (req.responseXML.getElementsByTagName('I').item(0)) {
                    var content = getNodeValue(getElementsByTagName('Content'));
                    var arr = JSON.parse(content);

                    //Buid tree
                    var parent = { 'ID': 0, 'Name': 'SƠ ĐỒ PHẢ HỆ DÒNG TỘC LÊ LƯƠNG', 'ParentID': null };
                    arr = arr.map(function (x) {
                        x.name = x.Name;
                        return x;
                    });
                    var tree = unflatten(arr);
                    tree = [
                        {
                            'ID': 0, 'name': 'SƠ ĐỒ PHẢ HỆ DÒNG TỘC LÊ LƯƠNG', 'ParentID': null,
                            'children': tree
                        }
                    ];

                    var oc = $('#PhaHe').orgchart({
                        'data': tree[0],
                        //'nodeContent': 'Name',
                        'pan': true,
                        'zoom': true
                    });

                    oc.$chartContainer.on('touchmove', function (event) {
                        event.preventDefault();
                    });
                }
            },
            'onError': function (req) {
            }
        }
    );
}

function unflatten(arr) {
    var tree = [],
        mappedArr = {},
        arrElem,
        mappedElem;

    // First map the nodes of the array to an object -> create a hash table.
    for (var i = 0, len = arr.length; i < len; i++) {
        arrElem = arr[i];
        mappedArr[arrElem.ID] = arrElem;
        mappedArr[arrElem.ID]['children'] = [];
    }


    for (var id in mappedArr) {
        if (mappedArr.hasOwnProperty(id)) {
            mappedElem = mappedArr[id];
            // If the element is not at the root level, add it to its parent array of children.
            if (mappedElem.ParentID) {
                mappedArr[mappedElem['ParentID']]['children'].push(mappedElem);
            }
            // If the element is at the root level, add it to first level elements array.
            else {
                tree.push(mappedElem);
            }
        }
    }
    return tree;
}

function sendContact(name, email, phone, title, content) {
    var num = Math.floor(Math.random() * 999999);
    sLink = '/Tools/Ajax.aspx?cmd=sendContact&name=' + name.value.trim() + '&email=' + email.value.trim() + '&phone=' + phone.value.trim() + '&title=' + title.value.trim() + '&content=' + content.value.trim() + '&rnd=' + num;
    showLoading('&nbsp;Đang gửi liên hệ...', 'lblLoad');

    AjaxRequest.get({
        'url': sLink,
        'onSuccess': function (req) {
            with (req.responseXML.getElementsByTagName("I").item(0)) {
                var sHtml = getNodeValue(getElementsByTagName("Content"));
                if (sHtml !== "") {
                    name.value = "";
                    email.value = "";
                    phone.value = "";
                    title.value = "";
                    content.value = "";
                    name.focus();
                    hideLoading();
                    alertSuccess(sHtml);
                    $("#closeAlert").click();
                }
            }
        },
        'onError': function (req) { }
    });
}

function getParameterByName(name, url) {
    if (!url) {
        url = window.location.href;
    }
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, " "));
}

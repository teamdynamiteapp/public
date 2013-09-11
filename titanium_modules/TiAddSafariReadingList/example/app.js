// This is a test harness for your module
// You should do something interesting in this harness 
// to test out the module and to provide instructions 
// to users on how to use it by example.


// open a single window
var window = Ti.UI.createWindow({
	backgroundColor:'white'
});
var label = Ti.UI.createLabel();
window.add(label);
window.open();

var addSafariReadingList = require('ti.addsafarireadinglist');
addSafariReadingList.addEventListener('done', function (e) {
    var message;
    if ( e.status ) {
        message = "safariのリーディングリストに追加しました";
    } else {
        switch ( e.message ) {
            case "not support url" :
                message = "サポートされていないURLの形式です";
            break;
            default:
                message = "追加できませんでした";
        }
    }
    Ti.UI.createAlertDialog({ message: message }).show();
});
addSafariReadingList.add(
    {
        title: 'twitter',
        url: 'http://twitter.com/',
        previewText: 'preview text'
    }
);
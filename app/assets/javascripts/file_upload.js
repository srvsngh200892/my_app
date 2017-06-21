
var checkFileType = function (event) {
    var ext = event.target.value.match(/\.(.+)$/)[1];
    if (ext != 'csv') {
        alert('please upload valid file type');
        this.value = '';
    }
};

$(document).on('change', '.js_file_upload_csv', checkFileType)


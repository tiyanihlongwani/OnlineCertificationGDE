var dataTable;

$(document).ready(function () {
    loadDataTable();
})

function loadDataTable() {   

    dataTable = $("#tblData").DataTable({

        "ajax": {
            "url": "/NationalPark/GetNationalPark/",
            "type": "GET",
            "datatype": "json",
        },
        "columns":
            [
                {
                    "data": "name", "width": "50%"
                },
                {
                    "data": "state", "width": "20%"
                },
                {
                    "data": "id",
                    "render": function (data) {
                        return '<div class="text-cener"><a href="/NationalPark/UpSert/' + data + '" class="btn btn-success btn-sm text-white" style="cursor:pointer;"><i class="far fa-edit"></i></a> &nbsp; <a onclick="/nationaPark/Delete/${' + data + '}" class="btn btn-danger btn-sm text-white" style="cursor:pointer;"><i class="far fa-trash-alt"></i></a> </div>';
                    }, "width": "30%"
                }
            ]
    });
}
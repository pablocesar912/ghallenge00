$(document).ready(function () {
    listarOT();
});


function listarOT() {
    var tablaData = '<thead class="datatable-head">' +
        '<tr class="datatable-row" style="left: 0px;">' +
        '<th data-field="Transportador" class="datatable-cell datatable-cell-sort">' +
        '<span style="width: 112px;">Transportador</span> </th>' +
        '<th data-field="Internacional" class="datatable-cell datatable-cell-sort">' +
        '<span style="width: 112px;">Internacional</span></th>' +
        '<th data-field="Carga Neg." class="datatable-cell datatable-cell-sort">' +
        '<span style="width: 112px;">Carga Neg.</span></th>' +
        '<th data-field="Kms" class="datatable-cell datatable-cell-sort">' +
        '<span style="width: 112px;">Kms</span></th>' +
        '<th data-field="Estado" class="datatable-cell datatable-cell-sort">' +
        '<span style="width: 112px;">Estado</span></th>' +
        '</tr>' +
        '</thead>';
    $.ajax({
        url: '/dashboard/ot/',
        dataType: 'json',
        type: "GET",
        success: function (data) {
            var internacional = "NO";
            var cargaNeg = "NO";
            for (let value of data) {
                if (value.internacional == true) {
                    internacional = "SI";
                }
                if (value.isCargaNegativa == true) {
                    cargaNeg = "SI";
                }
                tablaData += '<tbody id="bodyTable" class="datatable-body" style="">' +
                    '<tr id="contenidoTabla" class="datatable-row" style="left: 0px;">' +
                    '<td class="datatable-cell"><span style="width: 112px;"> ' + value.transporte.nombre + ' </span></td> ' +
                    '<td class="datatable-cell"><span style="width: 112px;"> ' + internacional + '</span></td> ' +
                    '<td class="datatable-cell"><span style="width: 112px;">' + cargaNeg + '</span></td> ' +
                    '<td class="datatable-cell"><span style="width: 112px;">' + value.kms + '</span></td> ' +
                    '<td class="datatable-cell"><span style="width: 112px;"> ' + value.estadoViaje + '</span></td> ' +
                    '</tr>' +
                    '</tbody>';
            }
            $('#tablaOrdenes').html(tablaData);
            $('#tituloTabla').html('Ordenes De Trabajo');
        },
        error: function (data) {
            console.log("error");
            console.log(data);
        }
    });
}

function setId(id){
	$("#coincidenciaId").val(id);
	console.log("ID: " + $("#coincidenciaId").val());
}

function asignarOS(){
	$.ajax({
		url: '/flota/asignarOS/',
		data: $("#modalAsignarForm").serialize(),
		dataType: "json",
		type: "POST",
		success: function(data) {
			console.log("Ok");
			location.reload();
		},
		error: function(data) {
			console.log("Error.");
		}
	});
}
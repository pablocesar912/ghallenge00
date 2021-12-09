$(document).ready(function () {
	listarOS();
	listarVehiculosDisponibles();
});

function listarOS() {
	var tablaData = '<thead class="datatable-head">' +
		'<tr class="datatable-row" style="left: 0px;">' +
		'<th data-field="N° Carga" class="datatable-cell datatable-cell-sort" style="width: 14%;">' +
		'<span>N° Carga</span> </th>' +
		'<th data-field="Cliente" class="datatable-cell datatable-cell-sort" style="width: 24%;">' +
		'<span>Cliente</span></th>' +
		'<th data-field="Destino" class="datatable-cell datatable-cell-sort" style="width: 29%;">' +
		'<span>Destino</span></th>' +
		'<th data-field="Fecha" class="datatable-cell datatable-cell-sort" style="width: 14%;">' +
		'<span>Fecha</span></th>' +
		'<th data-field="Estado" class="datatable-cell datatable-cell-sort" style="width: 14%;">' +
		'<span>Estado</span></th>' +
		'<th class="datatable-cell" style="width: 5%;">' +
		'<span>Acciones</span></th>' +
		'</tr>' +
		'</thead>';
	$.ajax({
		url: '/dashboard/os/',
		dataType: 'json',
		type: "GET",
		success: function (data) {
			for (let value of data) {
				tablaData += '<tbody class="datatable-body" style="">' +
					'<tr class="datatable-row" style="left: 0px;">' +
					'<td th:if="{value.nroInterno != null}" class="datatable-cell" style="width: 14%;"><span> ' + value.nroInterno + ' </span></td> ' +
					'<td th:if="{value.nroInterno == null}" class="datatable-cell" style="width: 14%;"><span> ' + value.idPedido + ' </span></td> ' +
					'<td class="datatable-cell" style="width: 24%;"><span> ' + value.cliente + '</span></td> ' +
					'<td class="datatable-cell" style="width: 29%;"><span> ' + value.destino + '</span></td> ' +
					'<td class="datatable-cell" style="width: 14%;"><span>' + value.fechaInicioEstimada + ' - ' + value.horaInicioEstimada +' </span></td> ' +
					'<td class="datatable-cell" style="width: 14%;"><span> ' + value.estado + '</span></td> ' +
					'<td data-field="Acciones" aria-label="698 Oriole Pass"' +
					'	class="datatable-cell">' +
					'' +
					'<a href="/viaje/pedido/detalle?id=' + value.idPedido + '"' +
					'	class="btn btn-sm btn-icon btn-light-primary mr-1">' +
					'	<i title="Detalle"' +
					'	class="flaticon-eye"></i>' +
					'	</a>' +
					'</td>' +
					'</tr>' +
					'</tbody>';
					
			}
			
//			var paginador = '<p>'+
//					'paspdpas'+
//					'</p>';
			
			$('#tablaOrdenes').html(tablaData);
			$('#paginador').html(paginador);
			$('#tituloTabla').html('Ordenes De Servicio');
		},
		error: function (data) {
			console.log("error");
			console.log(data);
		}
	});

}

function listarOT() {
	var tablaData = '<thead class="datatable-head">' +
		'<tr class="datatable-row" style="left: 0px;">' +
		'<th data-field="N° Carga" class="datatable-cell datatable-cell-sort" style="width: 15%;">' +
		'<span>N° Carga</span> </th>' +
		'<th data-field="Cliente" class="datatable-cell datatable-cell-sort" style="width: 25%;">' +
		'<span>Cliente</span></th>' +
		'<th data-field="Destino" class="datatable-cell datatable-cell-sort" style="width: 30%;">' +
		'<span>Destino</span></th>' +
		'<th data-field="Fecha" class="datatable-cell datatable-cell-sort" style="width: 15%;">' +
		'<span>Fecha</span></th>' +
		'<th data-field="Estado" class="datatable-cell datatable-cell-sort" style="width: 15%;">' +
		'<span>Estado</span></th>' +
		'</tr>' +
		'</thead>';
	$.ajax({
		url: '/dashboard/ot/',
		dataType: 'json',
		type: "GET",
		success: function (data) {
			for (let value of data) {
				tablaData += '<tbody class="datatable-body" style="">' +
					'<tr class="datatable-row" style="left: 0px;">' +
					'<td class="datatable-cell" style="width: 15%;"><span> ' + value.idPedido + ' </span></td> ' +
					'<td class="datatable-cell" style="width: 25%;"><span> ' + value.cliente + '</span></td> ' +
					'<td class="datatable-cell" style="width: 30%;"><span> ' + value.destino + '</span></td> ' +
					'<td class="datatable-cell" style="width: 15%;"><span>' + value.fechaInicioEstimada + ' - ' + value.horaInicioEstimada +' </span></td> ' +
					'<td class="datatable-cell" style="width: 15%;"><span> ' + value.estado + '</span></td> ' +
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


function listarVehiculosDisponibles() {
	var tablaData = '<thead class="datatable-head">' +
		'<tr class="datatable-row" style="left: 0px;">' +
		'<th data-field="Dominio" class="datatable-cell datatable-cell-sort">' +
		'<span style="width: 112px;">Dominio</span> </th>' +
		'<th data-field="Marca" class="datatable-cell datatable-cell-sort">' +
		'<span style="width: 112px;">Marca</span></th>' +
		'<th data-field="Modelo" class="datatable-cell datatable-cell-sort">' +
		'<span style="width: 112px;">Modelo</span></th>' +
		'<th data-field="Año" class="datatable-cell datatable-cell-sort">' +
		'<span style="width: 112px;">Año</span></th>' +
		'<th data-field="Estado" class="datatable-cell datatable-cell-sort">' +
		'<span style="width: 112px;">Estado</span></th>' +
		// '<th data-field="Acciones" class="datatable-cell datatable-cell-sort">' +
		// '<span style="width: 112px;">Acciones</span></th>' +
		'</tr>' +
		'</thead>';
	$.ajax({
		url: '/vehiculo/cVehiculo/',
		dataType: 'json',
		type: "GET",
		success: function (data) {
			for (let value of data) {
				var estado = "Disponible";
				tablaData += '<tbody class="datatable-body" style="">' +
					'<tr class="datatable-body" style="">' +
					'<tr class="datatable-row" style="left: 0px;">' +
					'<td class="datatable-cell"><span style="width: 112px;">' + value.dominio + ' </span></td>' +
					'<td class="datatable-cell"><span style="width: 112px;">' + value.modelo.marca.nombre + '</span></td>' +
					'<td class="datatable-cell"><span style="width: 112px;">' + value.modelo.nombre + '</span></td>' +
					'<td class="datatable-cell"><span style="width: 112px;">' + value.anioFabricacion + '</span></td>' +
					'<td class="datatable-cell"><span style="width: 112px;">' + estado + '</span></td>'+
					'</tr>' +
					'</tbody>';
			}
			$('#tablaVRC').html(tablaData);
			$('#tituloVRC').html('Vehiculos');

		},
		error: function (data) {
			console.log("error");
			console.log(data);
		}
	});
}

function listarRemolquesDisponibles() {
	var tablaData = '<thead class="datatable-head">' +
		'<tr class="datatable-row" style="left: 0px;">' +
		'<th data-field="Dominio" class="datatable-cell datatable-cell-sort">' +
		'<span style="width: 112px;">Dominio</span> </th>' +
		'<th data-field="Tipo" class="datatable-cell datatable-cell-sort">' +
		'<span style="width: 112px;">Tipo</span></th>' +
		'<th data-field="Modelo" class="datatable-cell datatable-cell-sort">' +
		'<span style="width: 112px;">Modelo</span></th>' +
		'<th data-field="Año" class="datatable-cell datatable-cell-sort">' +
		'<span style="width: 112px;">Año</span></th>' +
		'<th data-field="Estado" class="datatable-cell datatable-cell-sort">' +
		'<span style="width: 112px;">Estado</span></th>' +
		// '<th data-field="Acciones" class="datatable-cell datatable-cell-sort">' +
		// '<span style="width: 112px;">Acciones</span></th>' +
		'</tr>' +
		'</thead>';
	$.ajax({
		url: '/remolque/cRemolque/',
		dataType: 'json',
		type: "GET",
		success: function (data) {
			for (let value of data) {
				var estado = "Disponible";
				if (value.estado) {
					tablaData += '<tbody class="datatable-body" style="">' +
						'<tr class="datatable-row" style="left: 0px;">' +
						'<td class="datatable-cell"><span style="width: 112px;">' + value.dominio + '</span></td>' +
						'<td class="datatable-cell"><span style="width: 112px;">' + value.tipoRemolque.nombre + '</span></td>' +
						'<td class="datatable-cell"><span style="width: 112px;">' + value.tipoRemolque.nombre + '</span></td>' +
						'<td class="datatable-cell"><span style="width: 112px;">' + value.anioFabricacion + '</span></td>' +
						'<td class="datatable-cell"><span style="width: 112px;">' + estado + '</span></td>' +
						'</tr>' +
						'</tbody>';
				}
			}
			$('#tablaVRC').html(tablaData);
			$('#tituloVRC').html('Remolques');
		},
		error: function (data) {
			console.log("error");
			console.log(data);
		}
	});
}

function listarChoferesDisponibles() {
	var tablaData = '<thead class="datatable-head">' +
		'<tr class="datatable-row" style="left: 0px;">' +
		'<th data-field="Apellido" class="datatable-cell datatable-cell-sort">' +
		'<span style="width: 112px;">Apellido</span> </th>' +
		'<th data-field="Nombre" class="datatable-cell datatable-cell-sort">' +
		'<span style="width: 112px;">Nombre</span></th>' +
		'<th data-field="Documento" class="datatable-cell datatable-cell-sort">' +
		'<span style="width: 112px;">Documento</span></th>' +
		'<th data-field="Telefono" class="datatable-cell datatable-cell-sort">' +
		'<span style="width: 112px;">Telefono</span></th>' +
		'<th data-field="Mail" class="datatable-cell datatable-cell-sort">' +
		'<span style="width: 112px;">Mail</span></th>' +
		'<th data-field="Estado" class="datatable-cell datatable-cell-sort">' +
		'<span style="width: 112px;">Estado</span></th>' +
		// '<th data-field="Acciones" class="datatable-cell datatable-cell-sort">' +
		// '<span style="width: 112px;">Acciones</span></th>' +
		'</thead>';
	$.ajax({
		url: '/chofer/cChofer/',
		dataType: 'json',
		type: "GET",
		success: function (data) {
			for (let value of data) {
				var estado = "Operativo";
				if (value.estado) {
					tablaData +=
						'<tbody class="datatable-body" style="">' +
						'<tr class="datatable-row" style="left: 0px;">' +
						'<td class="datatable-cell"><span style="width: 112px;">' + value.apellido + '</span></td>' +
						'<td class="datatable-cell"><span style="width: 112px;">' + value.nombre + '</span></td>' +
						'<td class="datatable-cell"><span style="width: 112px;">' + value.documento + '</span></td>' +
						'<td class="datatable-cell"><span style="width: 112px;">' + value.telefono + '</span></td>' +
						'<td class="datatable-cell"><span style="width: 112px;">' + value.email + '</span></td>' +
						'<td class="datatable-cell"><span style="width: 112px;">' + estado + '</span></td>' +
						'</tr>' +
						'</tbody>';
				}
			}
			$('#tablaVRC').html(tablaData);
			$('#tituloVRC').html('Choferes');
		},
		error: function (data) {
			console.log("error");
			console.log(data);
		}
	});
}

function asignarOS(id){
	$("#coincidenciaId").val(id);
}

function guardarAsignarOS(){
	$.ajax({
		url: '/dashboard/asignarOS?idOS=' + $("#coincidenciaId").val() + '&idChofer=' +
			$("#selectChofer").val() + '&idVehiculo=' + $("#selectVehiculo").val() + '&idRemolque=' + $("#selectRemolque").val(),
		dataType: 'text',
		type: "GET",
		success: function(data) {
			location.reload();
		},
		error: function(data) {
			console.log("error");
			console.log(data);
		}
	});
}


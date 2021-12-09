$(document).ready(function() {
	listarVehiculos();
});

function listarVehiculos() {
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
		'<th data-field="Acciones" class="datatable-cell datatable-cell-sort">' +
		'<span style="width: 112px;">Acciones</span></th>' +
		'</tr>' +
		'</thead>' +
		'<tbody class="datatable-body" style="">';
	$.ajax({
		url: '/vehiculo/cVehiculo/',
		dataType: 'json',
		type: "GET",
		success: function(data) {
			for (let value of data) {
				var estado = "Disponible";
				if (value.estado == false) {
					estado = "En Reparacion";
				}
				tablaData += '<tr class="datatable-body" style="">' +
					'<tr class="datatable-row" style="left: 0px;">' +
					'<td class="datatable-cell"><span style="width: 112px;">' + value.dominio + ' </span></td>' +
					'<td class="datatable-cell"><span style="width: 112px;">' + value.modelo.marca.nombre + '</span></td>' +
					'<td class="datatable-cell"><span style="width: 112px;">' + value.modelo.nombre + '</span></td>' +
					'<td class="datatable-cell"><span style="width: 112px;">' + value.anioFabricacion + '</span></td>' +
					'<td class="datatable-cell"><span style="width: 112px;float=left">' + estado + '</span></td>' +

					'<td data-field="Acciones" aria-label="698 Oriole Pass"' +
					'	class="datatable-cell">' +
					'' +
					'<a href="/vehiculo/form?accion=actualizar&id=' + value.id + '"' +

					'	class="btn btn-sm btn-icon btn-light-primary mr-1">' +
					'	<i title="Editar propiedades del vehículo"' +
					'	class="flaticon2-pen"></i>' +
					'	</a>' +
					'<a href="/vehiculo/form?accion=eliminar&id=' + value.id + '"' +

					'	class="btn btn-sm btn-icon btn-light-primary mr-1">' +
					'	<i title="Eliminar vehículo"' +
					'	class="flaticon2-delete"></i>' +
					'</a>' +
					'	<a href= "/incidentes/listadoPorActivo?tipo=vehiculo&id=' + value.id + '"' +

					'	class="btn btn-sm btn-icon btn-light-primary mr-1">' +
					'	<i title="Gestión de incidentes asociados"' +
					'	class="flaticon2-warning"></i>' +
					'</a>' +

					'	<a href= "/plan/list?idTransporte=' + value.id + '&tipoTransporte=vehiculo&marcaTransporte=' + value.modelo.marca.nombre + '&dominioTransporte=' + value.dominio + '"' +

					'	class="btn btn-sm btn-icon btn-light-primary mr-1">' +
					'	<i title="Gestión de planes asociados"' +
					'	class="flaticon2-indent-dots"></i>' +
					'</a>' +

					'</tr>';

			}
			tablaData += '</tbody>';
			$('#tablaVRC').html(tablaData);
			$('#tituloVRC').html('Vehiculos');
		},
		error: function(data) {
			console.log("error");
			console.log(data);
		}
	});
}

function listarRemolques() {
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
		'<th data-field="Acciones" class="datatable-cell datatable-cell-sort">' +
		'<span style="width: 112px;">Acciones</span></th>' +
		'</tr>' +
		'</thead>';
	$.ajax({
		url: '/remolque/cRemolque/',
		dataType: 'json',
		type: "GET",
		success: function(data) {
			for (let value of data) {
				var estado = "";
				if (value.estado == true) {
					estado = "Disponible";
				} else {
					estado = "En Reparacion";
				}
				tablaData += '<tbody class="datatable-body" style="">' +
					'<tr class="datatable-row" style="left: 0px;">' +
					'<tr class="datatable-row" style="left: 0px;">' +
					'<td class="datatable-cell"><span style="width: 112px;">' + value.dominio + '</span></td>' +
					'<td class="datatable-cell"><span style="width: 112px;">' + value.tipoRemolque.nombre + '</span></td>' +
					'<td class="datatable-cell"><span style="width: 112px;">' + value.tipoRemolque.nombre + '</span></td>' +
					'<td class="datatable-cell"><span style="width: 112px;">' + value.anioFabricacion + '</span></td>' +
					'<td class="datatable-cell"><span style="width: 112px;">' + estado + '</span></td>' +

					'<td data-field="Acciones" aria-label="698 Oriole Pass"' +
					'	class="datatable-cell">' +
					'<a href="/remolque/form?accion=actualizar&id=' + value.id + '"' +

					'	class="btn btn-sm btn-icon btn-light-primary mr-1">' +
					'	<i title="Editar propiedades del remolque"' +
					'	class="flaticon2-pen"></i>' +
					'	</a>' +
					'<a href="/remolque/form?accion=eliminar&id=' + value.id + '"' +

					'	class="btn btn-sm btn-icon btn-light-primary mr-1">' +
					'	<i title="Eliminar remolque"' +
					'	class="flaticon2-delete"></i>' +
					'</a>' +
					'	<a href= "/incidentes/listadoPorActivo?tipo=remolque&id=' + value.id + '"' +

					'	class="btn btn-sm btn-icon btn-light-primary mr-1">' +
					'	<i title="Gestión de incidentes asociados"' +
					'	class="flaticon2-warning"></i>' +
					'</a>' +
					'	<a href= "/plan/list?idTransporte=' + value.id + '&tipoTransporte=remolque&marcaTransporte=' + value.modelo.marca.nombre + 
					'&dominioTransporte=' + value.dominio + '&accion=asignar"' +

					'	class="btn btn-sm btn-icon btn-light-primary mr-1">' +
					'	<i title="Asignar Plan"' +
					'	class="flaticon2-indent-dots"></i>' +
					'</a>' +
					'</tr>' +
					'</tbody>';
			}
			$('#tablaVRC').html(tablaData);
			$('#tituloVRC').html('Remolques');
		},
		error: function(data) {
			console.log("error");
			console.log(data);
		}
	});
}

function listarChoferes() {
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
		'<th data-field="Acciones" class="datatable-cell datatable-cell-sort">' +
		'<span style="width: 112px;">Acciones</span></th>' +
		'</tr>' +
		'</thead>';
	$.ajax({
		url: '/chofer/cChofer/',
		dataType: 'json',
		type: "GET",
		success: function(data) {
			for (let value of data) {
				var estado = "Operativo";
				if (value.estado == false) {
					estado = "Licencia";
				}
				tablaData += '<tbody class="datatable-body" style="">' +
					'<tr class="datatable-row" style="left: 0px;">' +
					'<tr class="datatable-row" style="left: 0px;">' +
					'<td class="datatable-cell"><span style="width: 112px;">' + value.apellido + '</span></td>' +
					'<td class="datatable-cell"><span style="width: 112px;">' + value.nombre + '</span></td>' +
					'<td class="datatable-cell"><span style="width: 112px;">' + value.documento + '</span></td>' +
					'<td class="datatable-cell"><span style="width: 112px;">' + value.telefono + '</span></td>' +
					'<td class="datatable-cell"><span style="width: 112px;">' + value.email + '</span></td>' +
					'<td class="datatable-cell"><span style="width: 112px;">' + estado + '</span></td>' +

					'<td data-field="Acciones" aria-label="698 Oriole Pass"' +
					'	class="datatable-cell">' +
					'' +
					'<a href="/chofer/form?accion=actualizar&id=' + value.id + '"' +

					'	class="btn btn-sm btn-icon btn-light-primary mr-1">' +
					'	<i title="Editar propiedades del chofer"' +
					'	class="flaticon2-pen"></i>' +
					'	</a>' +

					'<a href="/chofer/form?accion=eliminar&id=' + value.id + '"' +
					'	class="btn btn-sm btn-icon btn-light-primary mr-1">' +
					'	<i title="Eliminar chofer"' +
					'	class="flaticon2-delete"></i>' +
					'</a>' +

					'	<a href= "/plan/list?idTransporte=' + value.id + '&tipoTransporte=activo&marcaTransporte=' + value.modelo.marca.nombre + 
					'&dominioTransporte=' + value.dominio + '&accion=asignar"' +

					'	class="btn btn-sm btn-icon btn-light-primary mr-1">' +
					'	<i title="Asignar Plan"' +
					'	class="flaticon2-indent-dots"></i>' +
					'</a>' +
					'</td>';
				'</tr>' +
					'</tbody>';
			}
			$('#tablaVRC').html(tablaData);
			$('#tituloVRC').html('Choferes');
		},
		error: function(data) {
			console.log("error");
			console.log(data);
		}
	});
}

function listarActivos() {
	var tablaData = '<thead class="datatable-head">' +
		'<tr class="datatable-row" style="left: 0px;">' +
		'<th data-field="Nombre" class="datatable-cell datatable-cell-sort">' +
		'<span style="width: 112px;">Nombre</span> </th>' +
		'<th data-field="Tipo" class="datatable-cell datatable-cell-sort">' +
		'<span style="width: 112px;">Tipo</span></th>' +
		'<th data-field="Marca" class="datatable-cell datatable-cell-sort">' +
		'<span style="width: 112px;">Marca</span></th>' +
		'<th data-field="Modelo" class="datatable-cell datatable-cell-sort">' +
		'<span style="width: 112px;">Modelo</span></th>' +
		'<th data-field="Patente" class="datatable-cell datatable-cell-sort">' +
		'<span style="width: 112px;">Patente</span></th>' +
		'<th data-field="Identificador" class="datatable-cell datatable-cell-sort">' +
		'<span style="width: 112px;">Identificador</span></th>' +
		'<th data-field="Acciones" class="datatable-cell datatable-cell-sort">' +
		'<span style="width: 112px;">Acciones</span></th>' +
		'</tr>' +
		'</thead>';
	$.ajax({
		url: '/otrosActivos/cActivos/',
		dataType: 'json',
		type: "GET",
		success: function(data) {
			for (let value of data) {
				tablaData += '<tbody class="datatable-body" style="">' +
					'<tr class="datatable-row" style="left: 0px;">' +
					'<tr class="datatable-row" style="left: 0px;">' +
					'<td class="datatable-cell"><span style="width: 112px;">' + value.nombre + '</span></td>' +
					'<td class="datatable-cell"><span style="width: 112px;">' + value.tipoDeActivo + '</span></td>' +
					'<td class="datatable-cell"><span style="width: 112px;">' + value.marca + '</span></td>' +
					'<td class="datatable-cell"><span style="width: 112px;">' + value.modelo + '</span></td>' +
					'<td class="datatable-cell"><span style="width: 112px;">' + value.dominio + '</span></td>' +
					'<td class="datatable-cell"><span style="width: 112px;">' + value.identificador + '</span></td>' +
					'<td data-field="Acciones" aria-label="698 Oriole Pass"' +
					'	class="datatable-cell">' +
					'<a href=/otrosActivos/form?accion=actualizar&id=' + value.id +
					//					'   data-toggle="modal" data-target="#myModal1"' +
					'	class="btn btn-sm btn-icon btn-light-primary mr-1">' +
					'	<i title="Editar propiedades del activo"' +
					'	class="flaticon2-pen"></i>' +
					'	</a>' +
					'<a href=/otrosActivos/form?accion=eliminar&id=' + value.id +
					//					'   data-toggle="modal" data-target="#myModal1"' +
					'	class="btn btn-sm btn-icon btn-light-primary mr-1">' +
					'	<i title="Eliminar activo"' +
					'	class="flaticon2-delete"></i>' +
					'</a>' +
					'	<a href= "/incidentes/listadoPorActivo?tipo=activo&id=' + value.id + '"' +
					'	class="btn btn-sm btn-icon btn-light-primary mr-1">' +
					'	<i title="Gestión de incidentes asociados"' +
					'	class="flaticon2-warning"></i>' +
					'</a>' +
					'<a href= "/plan/list?idTransporte=' + value.id + '&tipoTransporte=activo&marcaTransporte=' + value.marca + 
					'&dominioTransporte=' + value.dominio + '&accion=asignar"' +

					'	class="btn btn-sm btn-icon btn-light-primary mr-1">' +
					'	<i title="Asignar Plan"' +
					'	class="flaticon2-indent-dots"></i>' +
					'</a>' +
					'</td>';
				'</tr>' +
					'</tbody>';
			}
			$('#tablaVRC').html(tablaData);
			$('#tituloVRC').html('Otros Activos');
		},
		error: function(data) {
			console.log("error");
			console.log(data);
		}
	});
}
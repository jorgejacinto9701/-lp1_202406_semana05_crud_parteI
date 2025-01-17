<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/global.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>

<title>Sistemas - Jorge Jacinto Gutarra</title>
</head>
<body>

<div class="container" style="margin-top: 4%">
		<h4>Crud Alumno</h4>
		<div class="row" style="margin-top: 3%">
			<div class="col-md-2">
				<label class="control-label">Nombre o Apellido</label>
			</div>
			<div class="col-md-3">
					<input class="form-control" type="text" id="id_filtro" name="nombres" placeholder="Ingrese el nombre">
			</div>
			<div class="col-md-2">
					<button type="button" class="btn btn-primary" id="id_filtrar">Filtrar</button>
			</div>		
			<div class="col-md-2">
					<button type="button" class="btn btn-primary" data-toggle='modal' data-target="#id_div_modal_registra" id="id_agregar">Agregar</button>
			</div>
		</div>

		<div class="row" style="margin-top: 3%">
			<table id="id_table" class="table table-bordered table-hover table-condensed" >
				<thead style='background-color:#337ab7; color:white'>
					<tr>
						<th>C�digo</th>
						<th>Nombres</th>
						<th>Apellidos</th>
						<th>DNI</th>
						<th>FechaNacimiento</th>
						<th>Pa�s</th>
						<th>Estado</th>
						<th></th>
						<th></th>
						<th></th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
		</div>
		
		
		<!-- INICIO MODAL DE REGISTRO -->
		<div class="modal fade" id="id_div_modal_registra" >
			<div class="modal-dialog" style="width: 60%">
					<div class="modal-content">
					<div class="modal-header" >
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4><span class="glyphicon glyphicon-ok-sign"></span> Registro de Alumno</h4>
					</div>
					<div class="modal-body" >
						 <div class="panel-group" id="steps">
			                   <div class="panel panel-default">
			                   		<div id="stepOne" class="panel-collapse collapse in">
			                   			<form id="id_form_registra">
			                   			<input type="hidden" name="metodo" value="paramInserta">
			                   			<div class="panel-body">
			                                <div class="row" style="margin-top: 4%">
												<div class="form-group col-md-6">
													<label class="control-label" for="id_nombre">Nombres</label>
													<input class="form-control" type="text" id="id_nombre" name="nombres" placeholder="Ingrese el nombre">	
												</div>
												<div class="form-group col-md-6">
													<label class="control-label" for="id_apellido">Apellidos</label>
													<input class="form-control" type="text" id="id_apellido" name="apellidos" placeholder="Ingrese el apellido">	
												</div>
											</div>
											<div class="row" style="margin-top: 2%">
												<div class="form-group col-md-3">
													<label class="control-label" for="id_telefono">Tel�fono</label>
													<input class="form-control" type="text" id="id_telefono" name="telefono" placeholder="Ingrese el tel�fono">	
												</div>
												<div class="form-group col-md-3">
													<label class="control-label" for="id_dni">DNI</label>
													<input class="form-control" type="text" id="id_dni" name="dni" placeholder="Ingrese el DNI">	
												</div>
												<div class="form-group col-md-6">
													<label class="control-label" for="id_correo">Correo</label>
													<input class="form-control" type="text" id="id_correo" name="correo" placeholder="Ingrese el correo">	
												</div>
											</div>
											<div class="row" style="margin-top: 2%">
												<div class="form-group col-md-6">
													<label class="control-label" for="id_fecha">Fecha Nacimiento</label>
													<input class="form-control" type="date" id="id_fecha" name="fechaNacimiento">	
												</div>
												<div class="form-group col-md-6">
													<label class="control-label" for="id_pais"> Pa�s </label> 
													<select	class="form-control" id="id_pais" name="pais" >
														<option value=" ">[Seleccione]</option>
													</select>
												</div>
											</div>
											<div class="row"  align="center" style="margin-top: 2%">
													<button type="button" style="width: 80px" id="id_btn_registra" class="btn btn-primary btn-sm">Registrar</button>
		                                        	<button type="button" style="width: 80px" id="id_btn_reg_cancelar" class="btn btn-primary btn-sm" data-dismiss="modal">Cancelar</button>
													
											</div>
			                             </div>
			                             </form>
			                        </div>
			                   </div>
			              </div>
					</div>
				</div>
			</div>
		</div>
 		<!-- FIN MODAL DE REGISTRO -->
 		
 		<!-- INICIO MODAL DE ACTUALIZAR -->
		<div class="modal fade" id="id_div_modal_actualiza" >
			<div class="modal-dialog" style="width: 60%">
					<div class="modal-content">
					<div class="modal-header" >
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4><span class="glyphicon glyphicon-ok-sign"></span> Actualiza de Alumno</h4>
					</div>
					<div class="modal-body" >
						 <div class="panel-group" id="steps">
			                   <div class="panel panel-default">
			                   		<div id="stepOne" class="panel-collapse collapse in">
			                   			<form id="id_form_actualiza">
			                   			<input type="hidden" name="metodo" value="paramActualiza">
			                   			<input type="hidden" name="idAlumno" id="idAlumno">
			                   			<div class="panel-body">
			                                <div class="row" style="margin-top: 4%">
												<div class="form-group col-md-6">
													<label class="control-label" for="id_nombre_actualiza">Nombres</label>
													<input class="form-control" type="text" id="id_nombre_actualiza" name="nombres" placeholder="Ingrese el nombre">	
												</div>
												<div class="form-group col-md-6">
													<label class="control-label" for="id_apellido_actualiza">Apellidos</label>
													<input class="form-control" type="text" id="id_apellido_actualiza" name="apellidos" placeholder="Ingrese el apellido">	
												</div>
											</div>
											<div class="row" style="margin-top: 2%">
												<div class="form-group col-md-3">
													<label class="control-label" for="id_telefono_actualiza">Tel�fono</label>
													<input class="form-control" type="text" id="id_telefono_actualiza" name="telefono" placeholder="Ingrese el tel�fono">	
												</div>
												<div class="form-group col-md-3">
													<label class="control-label" for="id_dni_actualiza">DNI</label>
													<input class="form-control" type="text" id="id_dni_actualiza" name="dni" placeholder="Ingrese el DNI">	
												</div>
												<div class="form-group col-md-6">
													<label class="control-label" for="id_correo_actualiza">Correo</label>
													<input class="form-control" type="text" id="id_correo_actualiza" name="correo" placeholder="Ingrese el correo">	
												</div>
											</div>
											<div class="row" style="margin-top: 2%">
												<div class="form-group col-md-4">
													<label class="control-label" for="id_fecha_actualiza">Fecha Nacimiento</label>
													<input class="form-control" type="date" id="id_fecha_actualiza" name="fechaNacimiento">	
												</div>
												<div class="form-group col-md-4">
													<label class="control-label" for="id_pais_actualiza"> Pa�s </label> 
													<select	class="form-control" id="id_pais_actualiza" name="pais" >
														<option value=" ">[Seleccione]</option>
													</select>
												</div>
												<div class="form-group col-md-4">
													<label class="control-label" for="id_estado_actualiza"> Estado </label> 
													<select	class="form-control" id="id_estado_actualiza" name="estado" >
														<option value=" ">[Seleccione]</option>
														<option value="1">Activo</option>
														<option value="0">Inactivo</option>
													</select>
												</div>
											</div>
											<div class="row"  align="center" style="margin-top: 2%">
													<button type="button" style="width: 80px" id="id_btn_actualiza" class="btn btn-primary btn-sm">Actualizar</button>
		                                        	<button type="button" style="width: 80px" id="id_btn_act_cancelar" class="btn btn-primary btn-sm" data-dismiss="modal">Cancelar</button>
													
											</div>
			                             </div>
			                             </form>
			                        </div>
			                   </div>
			              </div>
					</div>
				</div>
			</div>
		</div>
 		<!-- FIN MODAL DE ACTUALIZAR -->
		
</div>
<script type="text/javascript">

function agregarGrilla(lista){
	 $('#id_table').DataTable().clear();
	 $('#id_table').DataTable().destroy();
	 $('#id_table').DataTable({
			data: lista,
			language: IDIOMA,
			searching: true,
			ordering: true,
			processing: true,
			pageLength: 10,
			lengthChange: false,
			info:true,
			scrollY: 305,
	        scroller: {
	            loadingIndicator: true
	        },
			columns:[
				{data: "idAlumno",className:'text-center'},
				{data: "nombres",className:'text-center'},
				{data: "apellidos",className:'text-center'},
				{data: "dni", className:'text-center'},
				{data: "fechaNacimientoFormateada", className:'text-center'},
				{data: "pais.nombre",className:'text-center'},
				{data: function(row, type, val, meta){
					return row.estado == 1 ? "Activo" : "Inactivo";  
				},className:'text-center'},
				{data: function(row){
					return '<button type="button" class="btn btn-info btn-sm" onClick="busca(\'' + row.idAlumno + '\',\'' + row.nombres + '\',\'' + row.apellidos+ '\',\'' + row.dni+ '\',\'' + row.fechaNacimientoFormateada+ '\',\'' + row.correo + '\',\'' + row.telefono + '\',\'' + row.estado  + '\',\'' + row.pais.idPais + '\');">Editar</button>';  
				},className:'text-center'},
				{data: function(row){
					return '<button type="button" class="btn btn-warning btn-sm" onClick="eliminacionLogica(\'' + row.idAlumno + '\',\'' + row.estado  +'\');">E.L�gica</button>';  
				},className:'text-center'},
				{data: function(row){
					return '<button type="button" class="btn btn-danger btn-sm" onClick="eliminacionFisica(\'' + row.idAlumno + '\');">E.F�sica</button>';  
				},className:'text-center'},
			]                                     
	    });
}



$("#id_filtrar").click(function() {
    var vfiltro = $("#id_filtro").val();
    
    $.getJSON("crudAlumno", {"metodo":"paramLista", "filtro":vfiltro}, function(data) {
        agregarGrilla(data);
    });
    
});

function eliminacionLogica (idAlumno, estado){
 	$.ajax({
        url: 'crudAlumno',
        type: 'POST',
        data: {"metodo":"paramLogico", "id":idAlumno, "estado":estado},
        success: function(data){
        	mostrarMensaje(data.mensaje);
        	agregarGrilla(data.datos);
        },
        error: function(){
      	  mostrarMensaje(MSG_ERROR);
        }
    });
}


function eliminacionFisica (idAlumno){
	mostrarMensajeConfirmacion(MSG_ELIMINAR, accionElimnar, null, idAlumno);
}

function accionElimnar(idAlumno){
	console.log(">>> idAlumno " + idAlumno)
	 $.ajax({
          type: "POST",
          url: "crudAlumno", 
          data: {"metodo":"paramFisico", "id": idAlumno},
          success: function(data){
        	  console.log(data);
        	  agregarGrilla(data.datos);
        	  mostrarMensaje(data.mensaje);
          },
          error: function(){
        	  mostrarMensaje(MSG_ERROR);
          }
    });
}

function busca(idAlumno, nombres, apellidos, dni, fechaNacimiento, correo, telefono, estado, pais){
    $("#idAlumno").val(idAlumno);
    $("#id_nombre_actualiza").val(nombres);
    $("#id_apellido_actualiza").val(apellidos);
    $("#id_dni_actualiza").val(dni);
    $("#id_fecha_actualiza").val(fechaNacimiento);
    $("#id_correo_actualiza").val(correo);
    $("#id_telefono_actualiza").val(telefono);
    $("#id_estado_actualiza").val(estado);
    $("#id_pais_actualiza").val(pais);
    $('#id_div_modal_actualiza').modal('show');
}

$.getJSON("cargaComboPais", function(data) {
    $.each(data, function(index, value) {
        $("#id_pais").append("<option value='" + value.idPais + "'>" + value.nombre + "</option>");
        $("#id_pais_actualiza").append("<option value='" + value.idPais + "'>" + value.nombre + "</option>");
    });
});

</script>


</body>
</html>





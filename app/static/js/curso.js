axios.defaults.baseURL = window.location.href + '/';

var app = new Vue({
	el: '#app',
	delimiters: [ '${', '}' ],
	data: {
		errors: { nombre_form: {}, fecha_form: {}, descripcion_form: {}, tarea: {} },
		curso: { estudiantes: [] },
		nombre_form: { nombre: '' },
		descripcion_form: {},
		fecha_form: {},
		tarea: {},
		titulo_modal_tarea: '',
		mostrarEditar: {
			nombre: false,
			fecha_inicio: false,
			fecha_final: false,
			descripcion: false
		}
	},
	methods: {
		abrirModalNombre: function () {
			this.nombre_form.nombre = this.curso.nombre;
			$('#nombreModal').modal('show');
		},
		abrirModalFecha: function (keyword, fecha) {
			this.fecha_form = { fecha: fecha, titulo: keyword };
			$('#fechaModal').modal('show');
		},
		abrirModalDescripcion: function () {
			this.descripcion_form = { descripcion: this.curso.descripcion };
			$('#descripcionModal').modal('show');
		},
		abrirModalTarea: function (cmd) {
			this.tarea = {};
			$('#tarea-file-text').val('Seleccione un archivo...');

			if (cmd == 'new') this.titulo_modal_tarea = 'Nueva tarea';
			else if (cmd == 'edit') {
				this.titulo_modal_tarea = 'Editar tarea';
			}

			$('#tareaModal').modal('show');
		},
		elegirTarea: function (e) {
			var files = e.target.files;

			this.tarea.file = files.length != 0 ? files[0]:undefined;
			$('#tarea-file-text').val(files.length != 0 ? files[0].name:'Seleccione un archivo...');
		},
		cambiarNombre: function () {
			var vue = this;

			cargando();
			axios.post('cambiar-nombre/', vue.nombre_form).then(function (response) {
				cerrarCargando();

				vue.curso.nombre = vue.nombre_form.nombre;
				$('#nombreModal').modal('hide');
				swal('Exito', 'Nombre cambiado con exito.', 'success');
			}).catch(function (error) {
				cerrarCargando();
				
				if (error.response.status == '422') vue.errors.nombre_form = error.response.data;
				else mostrarError(error.response.data);
			})
		},
		cambiarFecha: function () {
			var vue = this;

			cargando();
			axios.post(`cambiar-fecha${vue.fecha_form.titulo}/`, vue.fecha_form).then(function (response) {
				cerrarCargando();

				vue.curso['fecha_'+vue.fecha_form.titulo] = vue.fecha_form.fecha;
				$('#fechaModal').modal('hide');
				swal('Exito', 'Fecha modificada con exito!', 'success');
			}).catch(function (error) {
				cerrarCargando();

				if (error.response.status == '422') vue.errors.fecha_form = error.response.data;
				else mostrarError(error.response.data);
			});
		},
		cambiarDescripcion: function () {
			var vue = this;

			cargando();
			axios.post('cambiar-descripcion/', vue.descripcion_form).then(function (response) {
				cerrarCargando();

				vue.curso.descripcion = vue.descripcion_form.descripcion;
				$('#descripcionModal').modal('hide');
				swal('Exito', 'Descripcion modificada con exito', 'success');
			}).catch(function (error) {
				cerrarCargando();

				if (error.response.status == '422') vue.errors.descripcion_form = error.response.data;
				else mostrarError(error.response.data);
			});
		},
		guardarTarea: function () {
			var vue = this;

			cargando();
			axios.post('guardar-tarea/', objectToFormData(vue.tarea)).then(function (response) {
				cerrarCargando();

				$('#tareaModal').modal('hide');
				swal('Exito', '¡Tarea guardada con exito!', 'success');
			}).catch(function (error) {
				cerrarCargando();

				if (error.response.status == '422') vue.errors.tarea = error.response.data;
				else mostrarError(error.response.data);
			});
		}
	},
	created: function () {
		$(function() {
			$('[data-toggle="tooltip"]').tooltip();
		});

		var vue = this;
		axios.get('datos-curso/').then(function (response) {
			vue.curso = response.data;
		});
	}
})
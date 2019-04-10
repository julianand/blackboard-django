var app = new Vue({
	el: '#app',
	delimiters: ['${', '}'],
	data: {
		datos: {},
		forms: {
			registro: {},
			login: {}
		},
		errors: {
			registro: {},
			login: {}
		}
	},
	methods: {
		init: function () {
			var vue = this;
			axios.get('datos-registro').then(function (response) {
				vue.datos = response.data;
			});
		},

		abrirModalRegistro: function () {
			this.forms.registro = {};
			$('#registroModal').modal('show');
		},

		registro: function () {
			var vue = this;
			cargando();

			axios.post('registro/', this.forms.registro).then(function (response) {
				vue.errors.registro = response.data;

				$('#registroModal').modal('hide');
				swal('Exito', 'Usuario registrado con exito', 'success');
			}).catch(function (error) {
				mostrarError(error.response.data);
			}).then(function () {
				cerrarCargando();
			});
		},

		login: function () {
			var vue = this;
			cargando();

			axios.post('login/', this.forms.login).then(function (response) {

			}).catch(function (error) {
				mostrarError(error.response.data);
			}).then(function () {
				cerrarCargando();
			});
		}
	},

	created: function () {
		this.init();
	}
});
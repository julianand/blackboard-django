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
				$('#registroModal').modal('hide');
				swal('Exito', 'Usuario registrado con exito', 'success');
			}).catch(function (error) {
				if (error.response.status == 422) vue.errors.registro = error.response.data;
				else mostrarError(error.response.data);
			}).then(function () {
				cerrarCargando();
			});
		},

		login: function () {
			var vue = this;
			cargando();

			axios.post('login/', this.forms.login).then(function (response) {
				cerrarCargando();

				actualizar();
			}).catch(function (error) {
				cerrarCargando();

				if (error.response.status == 422) vue.errors.login = error.response.data;
				else if (error.response.status == 500) mostrarError(error.response.data)
				else swal('Error', error.response.data, 'error');
			});
		}
	},

	created: function () {
		this.init();
	}
});
axios.defaults.baseURL = 'http://127.0.0.1:8000/';
axios.defaults.xsrfCookieName = 'csrftoken';
axios.defaults.xsrfHeaderName = 'X-CSRFToken';

function cargando (text = 'Cargando...') {
	swal({
		text: text,
		button: false,
		closeOnClickOutside: false,
		closeOnEsc: false
	});
}

function cerrarCargando () {
	swal.close();
}

function mostrarError (data) {
	var titulo = data.split('<h1>')[1].split('</h1>')[0];
	var texto = data.split('<pre class="exception_value">');

	if (texto.length > 1) texto = texto[1].split('</pre>')[0];
	else {
		texto = titulo;
		titulo = 'Error interno del servidor';
	};

	var div = document.createElement('DIV');

	div.innerHTML = titulo;
	titulo = div.innerText;

	div.innerHTML = texto;
	texto = div.innerText;
	
	swal(titulo, texto, 'error');
}

function actualizar () {
	window.location.href = window.location.href;
}

function objectToFormData(obj, rootName, ignoreList) {
    var formData = new FormData();

    function appendFormData(data, root) {
        if (!ignore(root)) {
            root = root || '';
            if (data instanceof File) {
                formData.append(root, data);
            } else if (Array.isArray(data)) {
                for (var i = 0; i < data.length; i++) {
                    appendFormData(data[i], root + '[' + i + ']');
                }
            } else if (typeof data === 'object' && data) {
                for (var key in data) {
                    if (data.hasOwnProperty(key)) {
                        if (root === '') {
                            appendFormData(data[key], key);
                        } else {
                            appendFormData(data[key], root + '.' + key);
                        }
                    }
                }
            } else {
                if (data !== null && typeof data !== 'undefined') {
                    formData.append(root, data);
                }
            }
        }
    }

    function ignore(root){
        return Array.isArray(ignoreList)
            && ignoreList.some(function(x) { return x === root; });
    }

    appendFormData(obj, rootName);

    return formData;
}
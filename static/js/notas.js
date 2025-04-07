
document.querySelectorAll('.v_nota').forEach(notaDiv => {
    notaDiv.addEventListener('click', () => {
        let notaNum = notaDiv.querySelector('p');
        let valorOriginal = notaNum.textContent.trim();
        let idNota = notaDiv.dataset.notaId;

        if (notaDiv.querySelector('input')) return;

        let notaInput = document.createElement('input');
        notaInput.type = 'number';
        notaInput.step = '0.1';
        notaInput.min = '0';
        notaInput.max = '20';
        notaInput.value = valorOriginal;
        notaInput.classList.add('nota-editable');

        notaDiv.replaceChild(notaInput, notaNum);
        notaInput.focus();

        function guardarNota() {
            let nuevoValor = notaInput.value.trim();
            if (nuevoValor === '') nuevoValor = valorOriginal;

            let nuevoNotaNum = document.createElement('p');
            nuevoNotaNum.textContent = nuevoValor;
            notaDiv.replaceChild(nuevoNotaNum, notaInput);

            fetch('/guardar_nota', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ id: idNota, nota: nuevoValor })
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    console.log('Nota guardada correctamente');
                    actualizarCursos(); // ✅ Llamamos a la función para actualizar los cursos
                } else {
                    console.error('Error al guardar la nota');
                }
            })
            .catch(err => console.error('Error al enviar la nota:', err));
        }

        notaInput.addEventListener('blur', guardarNota);
        notaInput.addEventListener('keydown', (e) => {
            if (e.key === 'Enter') {
                e.preventDefault();
                guardarNota();
            }
        });
    });
});

function actualizarCursos() {
    fetch('/obtener_cursos')
        .then(response => response.json())
        .then(data => {
            // console.log("Cursos actualizados:", data.cursos);
            // console.log("Unidades actualizadas:", data.unidades);

            data.cursos.forEach(curso => {
                let cursoDiv = document.querySelector(`.s_curso[data-curso-id="${curso.id}"] .v_curso`);
                if (cursoDiv) {
                    cursoDiv.innerHTML = `${curso.valor_calculado}`;
                }
            });

            data.unidades.forEach(unidad => {
                let unidadDiv = document.querySelector(`.s_unidad[data-unidad-id="${unidad.id}"] .v_unidad`);
                if (unidadDiv) {
                    unidadDiv.innerHTML = `${unidad.valor}`;
                }
            });
        })
        .catch(error => console.error("Error al actualizar los cursos:", error));
}


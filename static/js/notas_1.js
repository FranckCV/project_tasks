document.querySelectorAll('.v_nota').forEach(notaDiv => {
    notaDiv.addEventListener('click', () => {
        let notaNum = notaDiv.querySelector('p');
        let valorOriginal = notaNum.textContent.trim();
        let idNota = notaDiv.dataset.notaId; // Obtener ID de la nota

        // Evitar crear múltiples inputs si ya hay uno activo
        if (notaDiv.querySelector('input')) return;

        // Crear input
        let notaInput = document.createElement('input');
        notaInput.type = 'number';
        notaInput.step = '0.1';
        notaInput.min = '0';
        notaInput.max = '20';
        notaInput.value = valorOriginal;
        notaInput.classList.add('nota-editable');

        // Reemplazar el texto con el input
        notaDiv.replaceChild(notaInput, notaNum);
        notaInput.focus();

        // Función para guardar la nota
        function guardarNota() {
            let nuevoValor = notaInput.value.trim();
            if (nuevoValor === '') nuevoValor = valorOriginal; // Restaurar si está vacío

            // Crear de nuevo el elemento <p> con el nuevo valor
            let nuevoNotaNum = document.createElement('p');
            nuevoNotaNum.textContent = nuevoValor;
            notaDiv.replaceChild(nuevoNotaNum, notaInput);

            // 🔹 Enviar cambios al servidor
            fetch('/guardar_nota', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ id: idNota, nota: nuevoValor })
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    console.log('Nota guardada correctamente');
                } else {
                    console.error('Error al guardar la nota');
                }
            })
            .catch(err => console.error('Error al enviar la nota:', err));
        }

        // Guardar con "Enter" o al perder foco
        notaInput.addEventListener('blur', guardarNota);
        notaInput.addEventListener('keydown', (e) => {
            if (e.key === 'Enter') {
                e.preventDefault(); // Evita que el formulario se envíe si está dentro de uno
                guardarNota();
            }
        });
    });
});

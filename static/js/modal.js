
document.querySelectorAll('.clickable-modal').forEach(btn => {
    btn.addEventListener('click', () => {
        let modalSpaceID = btn.dataset.target;
        const modalSpace = document.querySelector(`#${modalSpaceID}.modal_space`);
        modalSpace.classList.add('active');

        const btnClose = modalSpace.querySelector('.close_modal ');
        btnClose.addEventListener('click', () => {
            modalSpace.classList.remove('active');
        });
    });
});

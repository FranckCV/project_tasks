
document.querySelectorAll('.clickable-modal').forEach(btn => {
    btn.addEventListener('click', () => {
        let modalSpaceID = btn.dataset.target;
        const modalSpace = document.querySelector(`#${modalSpaceID}.modal_space`);
        modalSpace.classList.add('active');
        
        const btnClose = modalSpace.querySelector('.close_modal ');
        btnClose.addEventListener('click', () => {
            modalSpace.classList.remove('active');
        });
        

        const modalNavs = modalSpace.querySelectorAll(`.modal_navs .nav`);
        if (modalNavs) {
            modalNavs.forEach(nav => {
                nav.addEventListener('click',() => {
                    modalNavs.forEach(n => {
                        n.classList.remove('nav_active');
                    });
                    nav.classList.add('nav_active');

                    activateNavContainer();
                    
                });
            });
            activateNavContainer();

        }

        function activateNavContainer() {
            let modalContID = modalSpace.querySelector('.nav_active').dataset.target;
            const containers = modalSpace.querySelectorAll(`.modal_navs_containers .modal_container `);
            containers.forEach(container => {
                if (container.id == modalContID) {
                    container.style.display = 'flex';
                } else {
                    container.style.display = 'none';
                }
            });
        }
        

    });
});



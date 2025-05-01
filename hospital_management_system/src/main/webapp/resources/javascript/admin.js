// Modern admin panel JS enhancements
// Add ripple effect to all buttons
document.addEventListener('DOMContentLoaded', function () {
    document.querySelectorAll('button').forEach(function (btn) {
        btn.addEventListener('click', function (e) {
            let ripple = document.createElement('span');
            ripple.className = 'ripple';
            ripple.style.left = e.offsetX + 'px';
            ripple.style.top = e.offsetY + 'px';
            this.appendChild(ripple);
            setTimeout(() => ripple.remove(), 600);
        });
    });
});

// Add ripple effect CSS dynamically
(function() {
    const style = document.createElement('style');
    style.innerHTML = `
    .ripple {
        position: absolute;
        border-radius: 50%;
        transform: scale(0);
        animation: ripple 0.6s linear;
        background: rgba(79,160,166,0.3);
        pointer-events: none;
        width: 100px;
        height: 100px;
        left: 0;
        top: 0;
        z-index: 10;
    }
    @keyframes ripple {
        to {
            transform: scale(2.5);
            opacity: 0;
        }
    }
    button { position: relative; overflow: hidden; }
    `;
    document.head.appendChild(style);
})();

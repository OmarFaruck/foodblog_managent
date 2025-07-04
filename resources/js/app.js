import { createApp, h } from 'vue'
import { createInertiaApp } from '@inertiajs/vue3'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap'
import './bootstrap'
// import './Assets/css/main.css'
// import '@fortawesome/fontawesome-free/css/all.css';

// Conditionally import CSS based on page type
const loadPageSpecificCSS = (pageName) => {
    // console.log(pageName);
    if (pageName.startsWith('Admin/')) {
        // console.log('Loading admin CSS');
       import('@/Assets/css/main.css')
       import('@fortawesome/fontawesome-free/css/all.css');
    } else {
        //  console.log('Loading frontend CSS');
        import('@/Assets/css/frontend.css');
    }
}

createInertiaApp({
    resolve: name => {
        //console.log(name);
        loadPageSpecificCSS(name);
        const pages = import.meta.glob('./Pages/**/*.vue', { eager: true })
        return pages[`./Pages/${name}.vue`]
    },
    setup({ el, App, props, plugin }) {
        const app = createApp({ render: () => h(App, props) });
        app.use(plugin)
        app.mount(el)
    },
})

import { defineConfig } from 'vite';
import laravel from 'laravel-vite-plugin';
import * as path from "path";

export default defineConfig({
    plugins: [
        laravel([
            'resources/css/app.css',
            'resources/js/app.js',
        ]),
    ],
    resolve:{
        alias:{
            '~alpine':path.resolve(__dirname,'node_modules/alpinejs'),
        }
    }
});

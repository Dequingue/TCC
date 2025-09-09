# TCC
-npm install express mysql2 cors

-npm init -y

-node -v

-exemplo cd cd E:\TCC\mentally node server.js
pelo git bash: cd /e/TCC/mentally
cd mentally 
-ls verificar o root

- para pasta servidor 
cd servidor
node server.js

intlar o npm
npm install
npm start

deixar automatico o npm:

npm install --save-dev nodemon

no package.jason: coloque

"scripts": {

  "start": "node servidor/server.js",
  
  "dev": "nodemon servidor/server.js"
  
}

npm run dev

-atualizar o front automatico
npm install browser-sync --save-dev

"scripts": {
  "dev": "concurrently \"npm run start\" \"npm run serve\"",
  "start": "nodemon servidor/server.js",
  "serve": "browser-sync start --proxy 'localhost:3000' --files 'public/**/*.*'"
}

npm install concurrently --save-dev

npm run dev

npm install bs-snippet-injector

const browserSync = require('browser-sync').create();
const snippetInjector = require('bs-snippet-injector');

browserSync.init({
  server: 'frontend',
  files: 'frontend/**/*.*',
  snippetOptions: {
    rule: {
      match: /<\/body>/i,
      fn: function (snippet, match) {
        return snippet + match;
      }
    } 
  }
});

npm install --save-dev cross-env

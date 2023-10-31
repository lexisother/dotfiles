const fs = require('fs');
const electron = require('electron');

const logger = hh.getLogger('Topaz');

module.exports = {
  loadAce() {
    if (process.browser) {
      require('ace-builds/src-noconflict/ace');
      require('ace-builds/src-noconflict/mode-javascript');
      require('ace-builds/src-noconflict/mode-css');
      require(`ace-builds/src-noconflict/theme-tomorrow_night`);
      return require('react-ace/dist/react-ace.js/main.js');
    } else {
      let items = '';
      try {
        for (const item of [
          'ace-builds/src-noconflict/ace',
          'ace-builds/src-noconflict/mode-javascript',
          'ace-builds/src-noconflict/mode-css',
          `ace-builds/src-noconflict/theme-tomorrow_night`,
          'react-ace/dist/react-ace.js/main.js',
        ]) {
          items += `${fs.readFileSync(require.resolve(item), 'utf8')}\n`;
        }
      } catch (err) {
        logger.warn("Config editing is disabled, install 'ace-builds' and 'react-ace'", err);
        return null;
      }
      electron.webFrame.executeJavaScript(items);
      return null;
    }
  },
};

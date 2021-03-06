/**
 * @license Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.html or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
    // Define changes to default configuration here. For example:
    // config.language = 'fr';
    // config.uiColor = '#AADC6E';
    config.toolbar = [
        ['Bold','Italic','Underline','StrikeThrough','-','Undo','Redo','-','Cut','Copy','Paste','Find','Replace','-','Outdent','Indent','-','Print'],
        ['NumberedList','BulletedList','-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
        '/',
        ['Styles','Format','Font','FontSize'],
        ['Image','Table','-','Link','Flash','Smiley','TextColor','BGColor','Source']
    ] ;
    config.skin = 'arkadmin,../../js/ckeditor/skins/arkadmin/'
};
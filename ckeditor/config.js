/**
 * @license Copyright (c) 2003-2015, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here.
	// For complete reference see:
	// http://docs.ckeditor.com/#!/api/CKEDITOR.config
	config.autoParagraph = false;
	config.toolbarGroups = [
        { name: 'tools' },
        { name: 'mode' },
        { name: 'document',    groups: [ 'document', 'doctools' ] },
        { name: 'clipboard',   groups: [ 'clipboard', 'undo' ] },
        { name: 'editing',     groups: [ 'find', 'selection' ] },
        '/',
        { name: 'paragraph',   groups: [ 'list', 'indent', 'blocks', 'align' ] },
        { name: 'links' },
        { name: 'insert' },
        '/',
        { name: 'styles' },
        { name: 'colors' },
        { name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] }
    ];
	config.removeDialogTabs = 'image:advanced;link:advanced';
	config.title = false;
};

// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require jquery.ui.all
//= require_tree .



// $(function() {
//     var availableTags = <%= Symptom.active.collect(&:name).sort %>;
//     function split( val ) {
//       return val.split( /,\s*/ );
//     }
//     function extractLast( term ) {
//       return split( term ).pop();
//     }

//     $( "#tags" )
//       // don't navigate away from the field on tab when selecting an item
//       .bind( "keydown", function( event ) {
//         if ( event.keyCode === $.ui.keyCode.TAB &&
//             $( this ).data( "ui-autocomplete" ).menu.active ) {
//           event.preventDefault();
//         }
//       })
//       .autocomplete({
//         minLength: 0,
//         source: function( request, response ) {
//           // delegate back to autocomplete, but extract the last term
//           response( $.ui.autocomplete.filter(
//             availableTags, extractLast( request.term ) ) );
//         },
//         focus: function() {
//           // prevent value inserted on focus
//           return false;
//         },
//         select: function( event, ui ) {
//           var terms = split( this.value );
//           // remove the current input
//           terms.pop();
//           // add the selected item
//           terms.push( ui.item.value );
//           // add placeholder to get the comma-and-space at the end
//           terms.push( "" );
//           this.value = terms.join( ", " );
//           return false;
//         }
//       });
//   });
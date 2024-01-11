// This is a manifest file that'll be compiled into boxwidget.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
$.CRM         = {};
$.CRM.options = {
  animationSpeed:   500,
  boxWidgetOptions: {
    boxWidgetIcons: {
      collapse: 'fa-minus',
      open:     'fa-plus',
      remove:   'fa-times'
    },
    boxWidgetSelectors: {
      collapse: '[data-widget="collapse"]',
      remove:   '[data-widget="remove"]'
    }
  }
};

$(function () {
  var o = $.CRM.options;

  _init();

  $.CRM.boxWidget.activate();
});

function _init() {
  $.CRM.boxWidget = {
    animationSpeed: $.CRM.options.animationSpeed,
    icons:          $.CRM.options.boxWidgetOptions.boxWidgetIcons,
    selectors:      $.CRM.options.boxWidgetOptions.boxWidgetSelectors,

    activate: function (_box) {
      var _this = this;

      if (!_box) {
        _box = document;
      }

      $(_box).on('click', _this.selectors.collapse, function (e) {
        e.preventDefault();
        _this.collapse($(this));
      });

      $(_box).on('click', _this.selectors.remove, function (e) {
        e.preventDefault();
        _this.remove($(this));
      });
    },

    collapse: function (element) {
      var _this       = this;
      var box         = element.parents(".box").first();
      var box_content = box.find("> .box-body, > .box-footer, > form  >.box-body, > form > .box-footer");

      if (!box.hasClass("collapsed-box")) {
        element.children(":first")
          .removeClass(_this.icons.collapse)
          .addClass(_this.icons.open);

        box_content.slideUp(_this.animationSpeed, function () {
          box.addClass("collapsed-box");
        });
      }

      else {
        element.children(":first")
          .removeClass(_this.icons.open)
          .addClass(_this.icons.collapse);

        box_content.slideDown(_this.animationSpeed, function () {
          box.removeClass("collapsed-box");
        });
      }
    },

    remove: function (element) {
      var box = element.parents(".box").first();
      box.slideUp(this.animationSpeed);
    }
  };
}

(function ($) {
  'use strict';

  $.fn.activateBox = function () {
    $.CRM.boxWidget.activate(this);
  };

  $.fn.toggleBox = function () {
    var button = $($.CRM.boxWidget.selectors.collapse, this);
    $.CRM.boxWidget.collapse(button);
  };

  $.fn.removeBox = function () {
    var button = $($.CRM.boxWidget.selectors.remove, this);
    $.CRM.boxWidget.remove(button);
  };
})(jQuery);

/*!
 * Star Rating <LANG> Translations
 *
 * This file must be loaded after 'fileinput.js'. Patterns in braces '{}', or
 * any HTML markup tags in the messages must not be converted or translated.
 *
 * @see http://github.com/kartik-v/bootstrap-star-rating
 * @author Kartik Visweswaran <kartikv2@gmail.com>
 *
 * NOTE: this file must be saved in UTF-8 encoding.
 */
(function ($) {
    "use strict";
    $.fn.ratingLocales['en'] = {
        defaultCaption: '{rating} Stars',
        starCaptions: {
            0.5: '0.5',
            1: '1',
            1.5: '1.5',
            2: '2',
            2.5: '2.5',
            3: '3',
            3.5: '3,5',
            4: '4',
            4.5: '4.5',
            5: '5'
        },
        clearButtonTitle: 'Clear',
        clearCaption: 'Not Rated'
    };
})(window.jQuery);

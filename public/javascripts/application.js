function initialize_collapsible_headers(css_selector)
{
    $$(css_selector).each(function(h2) {
        h2.onclick = function()
        {
            var is_open = this.readAttribute('class') == 'aberto';
            if (is_open)
            {
                this.siblings().each(function(el) {
                    el.hide();
                });
                this.writeAttribute('class', 'fechado');
            }
            else
            {
                this.siblings().each(function(el) {
                    el.show();
                });
                this.writeAttribute('class', 'aberto');
            }
            return false;
        }
    });
}

function initialize_watermark_fields()
{
    $$('.watermark').each(function(elem){
        elem.onfocus = function(){
            if(this.value == elem.readAttribute('watermark'))
                this.value = '';
        };

        elem.onblur = function(){
            if(this.value == '')
                this.value = elem.readAttribute('watermark');
        };

        elem.value = elem.readAttribute('watermark');
    });
}
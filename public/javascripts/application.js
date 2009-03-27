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
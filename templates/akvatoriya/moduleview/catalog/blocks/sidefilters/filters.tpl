{addjs file="jquery.slider.min.js"}
{addjs file="history.min.js" basepath="common"}
{addjs file="{$mod_js}jquery.filter.js" basepath="root"}


<section class="block filterSection">
    <div class="loadOverlay"></div>
    <form method="GET" class="filters" action="{urlmake f=null bfilter=null p=null}">
        {if $param.show_cost_filter}
			
			{if (strstr($smarty.server.REQUEST_URI, "/catalog/kulery/") || strstr($smarty.server.REQUEST_URI, "/catalog/filtry/")) }
            <div class="filter typeInterval fleft" style="margin-right: 20px;">
                <h4>Цена до:</h4>
                <table class="fromToLine">                    
                    <tr>                
                        <td><input type="text" class="textinp fromto" name="bfilter[cost][to]" value="{$basefilters.cost.to}" data-start-value=""></td>
                    </tr>                    
                </table>
            </div>
			{/if}
        {/if}
        {if $param.show_brand_filter && count($brands)>1}
            <div class="filter typeMultiselect fleft">
                <h4>{t}Производитель{/t}:</h4>
                <ul>
                    {foreach $brands as $brand}
                    <li>
                        <input type="checkbox" {if is_array($basefilters.brand) && in_array($brand.id, $basefilters.brand)}checked{/if} name="bfilter[brand][]" value="{$brand.id}" class="cb" id="cb_{$brand.id}_{$smarty.foreach.i.iteration}">
                        <label for="cb_{$brand.id}_{$smarty.foreach.i.iteration}">{$brand.title}</label>
                    </li>
                    {/foreach}
                </ul>
            </div>
        {/if}           
        {foreach $prop_list as $item}
        {foreach $item.properties as $prop}
            {if $prop.type == 'int'}
                <div class="filter typeInterval fleft">
                    <h4>{$prop.title}:</h4>
                    <table class="fullwidth typeInterval fromToLine">
                        <tbody>
                            <tr>
                                <td class="p50">от, {$prop.unit}</td>
                                <td></td>
                                <td class="p50">до, {$prop.unit}</td>
                            </tr>
                            <tr>
                                <td><input type="text" class="textinp fromto" name="f[{$prop.id}][from]" value="{$filters[$prop.id].from|default:$prop.interval_from}" data-start-value="{$prop.interval_from}"></td>
                                <td class="padd4">&mdash;</td>
                                <td><input type="text" class="textinp fromto" name="f[{$prop.id}][to]" value="{$filters[$prop.id].to|default:$prop.interval_to}" data-start-value="{$prop.interval_to}"></td>
                            </tr>
                        </tbody>
                    </table>
                    <input type="hidden" data-slider='{ "from":{$prop.interval_from}, "to":{$prop.interval_to}, "step": "{$prop.step}", "round": {$prop->getRound()}, "dimension": " {$prop.unit}", "heterogeneity": [{$prop->getHeterogeneity()}], "scale": [{$prop->getScale()}]  }' value="{$filters[$prop.id].from|default:$prop.interval_from};{$filters[$prop.id].to|default:$prop.interval_to}"}" class="pluginInput" data-start-value="{$prop.interval_from};{$prop.interval_to}">
                </div>                
            {elseif $prop.type == 'list'}
                <div class="filter typeMultiselect fleft" style="margin-right: 40px;">
                    <h4>{$prop.title}:</h4>
                    <ul>
                        {foreach $prop->getAllowedValues() as $key => $value}
                        <li><input type="checkbox" {if is_array($filters[$prop.id]) && in_array($value, $filters[$prop.id])}checked{/if} name="f[{$prop.id}][]" value="{$value}" class="cb" id="cb_{$prop.id}_{$value@iteration}">
                        <label for="cb_{$prop.id}_{$value@iteration}">{$value}</label></li>
                        {/foreach}
                    </ul>
                </div>
            {elseif $prop.type == 'bool'}
                <div class="filter fleft" style=" width: 240px;">
                    <h4 class="fleft" style="width: 150px;">{$prop.title}:</h4>
                    <select class="yesno" name="f[{$prop.id}]" data-start-value="">
                        <option value="">{t}Неважно{/t}</option>
                        <option value="1" {if $filters[$prop.id] == '1'}selected{/if}>{t}Есть{/t}</option>
                        <option value="0" {if $filters[$prop.id] == '0'}selected{/if}>{t}Нет{/t}</option>
                    </select>
                </div>
            {else} {* string *}
                <div class="filter fleft">
                    <h4>{$prop.title}:</h4>
                    <input type="text" class="textinp string" name="f[{$prop.id}]" value="{$filters[$prop.id]}">
                </div>
            {/if}               
        {/foreach}
        {/foreach}
		<div class="cb"></div>
        <div class="buttons">
            <input type="submit" class="button submitFilter" value="Применить">
            <a href="{urlmake f=null p=null bfilter=null}" class="button cleanFilter{if empty($filters) && empty($basefilters)} hidden{/if}">сбросить</a>
        </div>        
        
        
        <script type="text/javascript">
            $(function() {
                $('.typeInterval .pluginInput').each(function() {
                    var $this = $(this);
                    var fromTo = $this.siblings('.fromToLine').hide();
                    $this.jslider( $.extend( $(this).data('slider'), { callback: function(value) {
                        var values = value.split(';');
                        $('input[name$="[from]"]', fromTo).val(values[0]);
                        $('input[name$="[to]"]', fromTo).val(values[1]);
                        $this.trigger('change');
                    }}));
                    
                    $('input[name$="[from]"], input[name$="[to]"]', fromTo).change(function() {
                        var from = $('input[name$="[from]"]', fromTo).val();
                        var to = $('input[name$="[to]"]', fromTo).val();
                        $this.jslider('value', from, to);
                    });
                });
            });
        </script>        
    </form>
</section>

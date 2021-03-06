<div class="onePageDeliveryBlock">
    <input type="hidden" name="delivery" value="0">
    <div class="formSection">
        <span class="formSectionTitle">{t}Доставка{/t}</span>
    </div>    
    <table class="formTable">
        {foreach from=$delivery_list item=item}
            {if $item.class != 'myself' || $order.only_pickup_points == 1}
                {$addittional_html = $item->getAddittionalHtml($order)}
                {$something_wrong = $item->getTypeObject()->somethingWrong($order)}
                <tr class="row">
                    <td class="value fixedRadio topPadd" width="40">
                        <input type="radio" name="delivery" value="{$item.id}" id="dlv_{$item.id}" {if $order.delivery==$item.id}checked{/if} {if $something_wrong}disabled="disabled"{/if}>
                    </td>
                    <td class="value marginRadio topPadd" colspan="2">
                        <div class="middleBox">
                            <label for="dlv_{$item.id}">{$item.title}</label>
                            {* Если выбран самовывоз покажем склады для выбора *}
                            {if $item.class=='myself' && !empty($warehouses)}
                                {$pvzList = $item->getTypeObject()->getOption('pvz_list')}
                                <div class="warehouseBlock">
                                    <p class="title">{t}Выберите пункт выдачи{/t}:</p>
                                    <select name="warehouse" {if $order.delivery!=$item.id}disabled="disabled"{/if}>
                                        {foreach $warehouses as $warehouse}
                                            {if empty($pvzList) || in_array(0, $pvzList) || in_array($warehouse.id, $pvzList)}
                                                <option value="{$warehouse.id}" {if $order.warehouse==$warehouse.id}selected="selected"{/if}>{$warehouse.title}</option>
                                            {/if}
                                        {/foreach}
                                    </select>
                                </div>
                            {/if}
                            <div class="help">{$item.description}</div>
                            <div class="additionalInfo">{$addittional_html}</div>
                        </div>
                    </td>
                    <td class="value marginRadio checkoutPriceCol">
                        {if $something_wrong}
                            <span style="color:red;">{$something_wrong}</span>
                        {else}
                            <span class="help">{$order->getDeliveryExtraText($item)}</span>
                            {$dcost=$order->getDeliveryCostText($item)}
                            {if $dcost>0}
                                <span id="scost_{$item.id}" class="scost">{$dcost}</span>
                            {else}
                                {$dcost}
                            {/if}
                        {/if}
                    </td>
                </tr>
            {/if}
        {/foreach}
    </table>
</div>
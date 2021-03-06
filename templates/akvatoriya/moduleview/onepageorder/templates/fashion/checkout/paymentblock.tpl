<div class="onePagePaymentBlock">
    <h2>{t}Оплата{/t}</h2>
    <input type="hidden" name="payment" value="0">
    <ul class="vertItems noPrice">
        {foreach $pay_list as $item}
        <li {if $item@first}class="first"{/if}>
            <div class="radio">
                <input type="radio" name="payment" value="{$item.id}" id="pay_{$item.id}" {if $order.payment==$item.id}checked{/if}>
                <span class="back"></span>
            </div>
            <div class="info">
                <div class="line">
                    <label for="pay_{$item.id}" class="title">{$item.title}</label>
                </div>
                {if $item.title == 'БЕЗНАЛИЧНАЯ ОПЛАТА ПО ВЫСТАВЛЕННОМУ СЧЕТУ'}
                <p class="pay__attention" style="color: red; font-size: 18px; text-transform: uppercase; padding: 10px 20px;">Данный способ оплаты предназначен только для ИП и Юридических лиц!!!</p>
                {/if}
                <p class="descr">
                    {if !empty($item.picture)}
                       <img class="logoService" src="{$item.__picture->getUrl(100, 100, 'xy')}"/>
                    {/if}
                {$item.description}</p>
            </div>
        </li>
        {/foreach}
    </ul>
</div>
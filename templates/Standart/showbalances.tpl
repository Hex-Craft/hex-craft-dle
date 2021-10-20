<span class="name-rog">
{description}
<div class="news-link" style="padding:20px; margin-bottom: 0px; color: #828282; font-weight: 300; height: 530px;">
<table cellpadding="3" cellspacing="0" class="tbl" style="border-collapse:collapse;border:1px solid #dde0e3;float:left;margin-right:20px;margin-bottom:20px; display: block; border-radius: 5px;" width="450">
    <thead style="border-bottom: 1px solid #dde0e3;">
        <tr>
            <th class="label_th" style="width:225px;">Сервер</th>
            <th class="label_th" style="width:225px;">Хексели</th>
        </tr>
    </thead>
	<thead style="border-bottom: 1px solid #dde0e3;">
        <tr>
            <th class="label_th" style="width:225px;">CLASSIC 1.16.2</th>
            <th class="label_th" style="width:225px;">{include file="game_modules/balance/balance_classic.php"}</th>
        </tr>
    </thead>
    <thead style="border-bottom: 1px solid #dde0e3;">
        <tr>
            <th class="label_th">HI-TECH 1.12.2</th>
            <th class="label_th">{include file="game_modules/balance/balance_hitech.php"}</th>
        </tr>
    </thead>
	<thead style="border-bottom: 1px solid #dde0e3;">
        <tr>
            <th class="label_th">-</th>
            <th class="label_th">-</th>
        </tr>
    </thead>
	<thead>
        <tr>
            <th class="label_th">-</th>
            <th class="label_th">-</th>
        </tr>
    </thead>
    <tbody></tbody>
</table>
<div style="float: right;padding: 20px;border: 1px solid #dde0e3;border-radius: 5px;margin-bottom: 20px;">
<h6>Перевод хекселей с сайта на сервер</h6>
<form action="game_modules/balance/balance_manager.php" method="POST" style="margin: 0px;">
	<input type="hidden" name="login" value="{login}">
	<input type="text" name="hexels" style="font-size: 16px; height: 40px;">
	<select name="server" style="display: block;font-size: 16px; height: 40px;margin-top: 15px;">
	  <option value="1">Classic</option>
	  <option value="2">Hi-tech</option>
	</select>
	<input type="hidden" name="type" value="1">
	<input type="submit" value="Перевести" style="font-size: 16px;width: 302px;margin-top: 15px;height: 40px;">
</form>
</div>
<div style="float: right;padding: 20px;border: 1px solid #dde0e3;border-radius: 5px;">
<h6>Перевод хекселей с сервера на сайт</h6>
<form action="game_modules/balance/balance_manager.php" method="POST" style="margin: 0px;">
	<input type="hidden" name="login" value="{login}">
	<h6 style="color: gray">(Комиссия 10%)</h6>
	<input type="text" name="hexels" style="font-size: 16px; height: 40px;">
	<select style="display: block;font-size: 16px; height: 40px;margin-top: 15px;">
	  <option value="1">Classic</option>
	  <option value="2">Hi-tech</option>
	</select>
	<input type="hidden" name="type" value="2">
	<input type="submit" value="Перевести" style="font-size: 16px;width: 302px;margin-top: 15px;height: 40px;">
</form>
</div>
</div>
</span>
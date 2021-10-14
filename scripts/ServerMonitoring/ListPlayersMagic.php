<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/Classes/xPaw/MinecraftQuery.class.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/Classes/xPaw/MinecraftQueryException.class.php';
	
$json = file_get_contents($_SERVER['DOCUMENT_ROOT'] . "/scripts/Config/Creditentials.json");
$creditentials = json_decode($json, true);
	
use xPaw\MinecraftQuery;
use xPaw\MinecraftQueryException;

define( 'MQ_SERVER_ADDR', $creditentials['pinger_ip'] );
define( 'MQ_SERVER_PORT', $creditentials['magic']['port'] );
define( 'MQ_TIMEOUT', 1 );

$Timer = MicroTime( true );

$Query = new MinecraftQuery( );

try
{
	$Query->Connect( MQ_SERVER_ADDR, MQ_SERVER_PORT, MQ_TIMEOUT );
}
catch( MinecraftQueryException $e )
{
	$Exception = $e;
}

$Timer = Number_Format( MicroTime( true ) - $Timer, 4, '.', '' );
?>
    <div class="container">
<?php if( isset( $Exception ) ): ?>
		<div class="panel panel-primary">
			<div class="panel-heading"><?php echo htmlspecialchars( $Exception->getMessage( ) ); ?></div>
			<div class="panel-body"><?php echo nl2br( $e->getTraceAsString(), false ); ?></div>
		</div>
<?php else: ?>
		<div class="row">
			<div class="col-sm-6">
				<table class="table table-bordered table-striped" style="border: none;">
					<tbody>
<?php if( ( $Players = $Query->GetPlayers( ) ) !== false ): ?>
<?php foreach( $Players as $Player ): ?>
						<tr>
							<td style="width: 200px; border: 1px solid #828282; border-radius: 5px;display: block;">
								<img src='/skin.php?user=<?php echo htmlspecialchars( $Player ); ?>&mode=3' class='playerimg' style="margin-right: 10px;">
								<a style="cursor: pointer;"onclick="ShowProfile('<?php echo htmlspecialchars( $Player ); ?>', 'https://hex-craft.ru/user/<?php echo htmlspecialchars( $Player ); ?>/', '1'); return false;"><?php echo htmlspecialchars( $Player ); ?></a>
							</td>
						</tr>
<?php endforeach; ?>
<?php else: ?>
						<tr>
						</tr>
							<td>На сервере никого нет, стань первым :^)<?php endif; ?>
					</tbody>
				</table>
			</div>
		</div>
<?php endif; ?>
	</div>

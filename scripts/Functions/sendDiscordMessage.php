<?php

function sendDicordMessage($webhookurl, $name, $content, $embed_title, $description, $url, $panel_color) {
	$timestamp = date("c", strtotime("now"));

	$json_data = json_encode([

		"content" => $content,
		"username" => $name,
		"tts" => false,
		"embeds" => [
			[
				// Embed Title
				"title" => $embed_title,

				// Embed Type
				"type" => "rich",

				// Embed Description
				"description" => $description,

				// URL of title link
				"url" => $url,

				// Timestamp of embed must be formatted as ISO8601
				"timestamp" => $timestamp,

				// Embed left border color in HEX
				"color" => hexdec( $panel_color ),

				// Footer
				"footer" => [
					"text" => "Hex-Craft",
					"icon_url" => "https://hex-craft.ru"
				]
			]
		]

	], JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE );


	$ch = curl_init( $webhookurl );
	curl_setopt( $ch, CURLOPT_HTTPHEADER, array('Content-type: application/json'));
	curl_setopt( $ch, CURLOPT_POST, 1);
	curl_setopt( $ch, CURLOPT_POSTFIELDS, $json_data);
	curl_setopt( $ch, CURLOPT_FOLLOWLOCATION, 1);
	curl_setopt( $ch, CURLOPT_HEADER, 0);
	curl_setopt( $ch, CURLOPT_RETURNTRANSFER, 1);

	$response = curl_exec( $ch );
	// echo $response;
	curl_close( $ch );
}
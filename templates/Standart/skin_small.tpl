	<canvas id="skin_container" style="position: absolute; top: 55px;"></canvas>
	<div class="controls" style="visibility: hidden;position: absolute;top: 335px;height: 40px;">
		<div style="display: inline-block; visibility: visible;">
			<button id="reset_all" type="button" class="control" style="width: 95px;margin-right: 10px;">Сброс</button>
			<button id="animation_pause_resume" type="button" class="control" style="width: 95px;">Пауза</button>
		</div>
		<label><input id="rotate_animation" type="checkbox" checked=""> Вращ</label>
		<div class="control" style="visibility: visible; width: 200px;text-align: center;">
			<label><input type="radio" id="primary_animation_walk" name="primary_animation" value="walk" checked=""> Ходьба</label>
			<label><input type="radio" id="primary_animation_run" name="primary_animation" value="run"> Бег</label>
			<label><input type="radio" id="primary_animation_fly" name="primary_animation" value="fly"> Полёт</label>
		</div>
		<div class="control-section">
			<label class="control"><input id="canvas_width" type="number" value="200"></label>
			<label class="control"><input id="canvas_height" type="number" value="300"></label>
		</div>
		<div class="control-section">
			<label class="control"><input id="global_animation_speed" type="number" value="1" step="0.1"></label>
			
			<div>
				
				<label class="control"><input id="rotate_animation_speed" type="number" value="0.3" step="0.1"></label>
			</div>
			<div>
				
				<label class="control"><input id="primary_animation_speed" type="number" value="1" step="0.1"></label>
			</div>
		</div>
		<div class="control-section">
			<div class="control">
				<label><input type="checkbox" id="control_rotate" checked=""></label>
				<label><input type="checkbox" id="control_zoom" checked=""></label>
				<label><input type="checkbox" id="control_pan"></label>
			</div>
		</div>
		<div class="control-section">
			<table id="layers_table">
				<tbody>
					<tr>
						<td><input type="checkbox" data-layer="innerLayer" data-part="head" checked=""></td>
						<td><input type="checkbox" data-layer="innerLayer" data-part="body" checked=""></td>
						<td><input type="checkbox" data-layer="innerLayer" data-part="rightArm" checked=""></td>
						<td><input type="checkbox" data-layer="innerLayer" data-part="leftArm" checked=""></td>
						<td><input type="checkbox" data-layer="innerLayer" data-part="rightLeg" checked=""></td>
						<td><input type="checkbox" data-layer="innerLayer" data-part="leftLeg" checked=""></td>
					</tr>
					<tr>
						<td><input type="checkbox" data-layer="outerLayer" data-part="head" checked=""></td>
						<td><input type="checkbox" data-layer="outerLayer" data-part="body" checked=""></td>
						<td><input type="checkbox" data-layer="outerLayer" data-part="rightArm" checked=""></td>
						<td><input type="checkbox" data-layer="outerLayer" data-part="leftArm" checked=""></td>
						<td><input type="checkbox" data-layer="outerLayer" data-part="rightLeg" checked=""></td>
						<td><input type="checkbox" data-layer="outerLayer" data-part="leftLeg" checked=""></td>
					</tr>
				</tbody>
			</table>
			<div>
				<div class="control">
					<label><input type="radio" id="back_equipment_cape" name="back_equipment" value="cape" checked=""> Cape</label>
					<label><input type="radio" id="back_equipment_elytra" name="back_equipment" value="elytra"> Elytra</label>
				</div>
			</div>
		</div>
		<div class="control-section">
			<div>
				<div class="control">
					<input id="skin_url" type="text" value="{usertitle}" placeholder="none" list="default_skins">
					<input id="skin_url_upload" type="file" accept="image/*" style="display: none;">
				</div>
				<label class="control">
					<select id="skin_model">
						<option value="auto-detect" selected=""></option>
					</select>
				</label>
			</div>
			<div>
				<div class="control">
					<input id="cape_url" type="text" value="{usertitle}" placeholder="none" list="default_capes">
					<input id="cape_url_upload" type="file" accept="image/*" style="display: none;">
				</div>
			</div>
		</div>
	</div>
	<script src="/js/vendor/skinview3d.bundle.js"></script>
	<script>
		const skinParts = ["head", "body", "rightArm", "leftArm", "rightLeg", "leftLeg"];
		const skinLayers = ["innerLayer", "outerLayer"];
		const availableAnimations = {
			walk: skinview3d.WalkingAnimation,
			run: skinview3d.RunningAnimation,
			fly: skinview3d.FlyingAnimation
		};

		let skinViewer;
		let orbitControl;
		let rotateAnimation;
		let primaryAnimation;
		
		function UrlExists(url)
		{
			var http = new XMLHttpRequest();
			http.open('HEAD', url, false);
			http.send();
			return http.status!=404;
		}
		
		function reloadSkin() {
			const input = document.getElementById("skin_url");
			const url = '/skins/' + input.value + '.png';
			if (UrlExists(url) === false) {
				skinViewer.loadSkin('/skins/default_char.png');
				input.setCustomValidity("");
			} else {
				skinViewer.loadSkin(url, document.getElementById("skin_model").value)
					.then(() => input.setCustomValidity(""))
					.catch(e => {
						input.setCustomValidity("Image can't be loaded.");
						console.error(e);
					});
			}
		}

		function reloadCape() {
			const input = document.getElementById("cape_url");
			const url = '/cloaks/' + input.value + '.png';
			if (UrlExists(url) === false) {
				skinViewer.loadCape('/cloaks/default_char.png');
				input.setCustomValidity("");
			} else {
				const selectedBackEquipment = document.querySelector('input[type="radio"][name="back_equipment"]:checked');
				skinViewer.loadCape(url, { backEquipment: selectedBackEquipment.value })
					.then(() => input.setCustomValidity(""))
					.catch(e => {
						input.setCustomValidity("Image can't be loaded.");
						console.error(e);
					});
			}
		}

		function initializeControls() {
			document.getElementById("canvas_width").addEventListener("change", e => skinViewer.width = e.target.value);
			document.getElementById("canvas_height").addEventListener("change", e => skinViewer.height = e.target.value);
			document.getElementById("global_animation_speed").addEventListener("change", e => skinViewer.animations.speed = e.target.value);
			document.getElementById("animation_pause_resume").addEventListener("click", () => skinViewer.animations.paused = !skinViewer.animations.paused);
			document.getElementById("rotate_animation").addEventListener("change", e => {
				if (e.target.checked && rotateAnimation === null) {
					rotateAnimation = skinViewer.animations.add(skinview3d.RotatingAnimation);
					rotateAnimation.speed = document.getElementById("rotate_animation_speed").value;
				} else if (!e.target.checked && rotateAnimation !== null) {
					rotateAnimation.resetAndRemove();
					rotateAnimation = null;
				}
			});
			document.getElementById("rotate_animation_speed").addEventListener("change", e => {
				if (rotateAnimation !== null) {
					rotateAnimation.speed = e.target.value;
				}
			});
			for (const el of document.querySelectorAll('input[type="radio"][name="primary_animation"]')) {
				el.addEventListener("change", e => {
					if (primaryAnimation !== null) {
						primaryAnimation.resetAndRemove();
						primaryAnimation = null;
					}
					if (e.target.value !== "") {
						primaryAnimation = skinViewer.animations.add(availableAnimations[e.target.value]);
						primaryAnimation.speed = document.getElementById("primary_animation_speed").value;
					}
				});
			}
			document.getElementById("primary_animation_speed").addEventListener("change", e => {
				if (primaryAnimation !== null) {
					primaryAnimation.speed = e.target.value;
				}
			});
			document.getElementById("control_rotate").addEventListener("change", e => orbitControl.enableRotate = e.target.checked);
			document.getElementById("control_zoom").addEventListener("change", e => orbitControl.enableZoom = e.target.checked);
			document.getElementById("control_pan").addEventListener("change", e => orbitControl.enablePan = e.target.checked);
			for (const part of skinParts) {
				for (const layer of skinLayers) {
					document.querySelector(`#layers_table input[type="checkbox"][data-part="${part}"][data-layer="${layer}"]`)
						.addEventListener("change", e => skinViewer.playerObject.skin[part][layer].visible = e.target.checked);
				}
			}
			const skinReader = new FileReader();
			skinReader.addEventListener("load", e => {
				document.getElementById("skin_url").value = skinReader.result;
				reloadSkin();
			});
			document.getElementById("skin_url_upload").addEventListener("change", e => {
				const file = e.target.files[0];
				if (file !== undefined) {
					skinReader.readAsDataURL(file);
				}
			});
			const capeReader = new FileReader();
			capeReader.addEventListener("load", e => {
				document.getElementById("cape_url").value = capeReader.result;
				reloadCape();
			});
			document.getElementById("cape_url_upload").addEventListener("change", e => {
				const file = e.target.files[0];
				if (file !== undefined) {
					capeReader.readAsDataURL(file);
				}
			});
			document.getElementById("skin_url").addEventListener("change", () => reloadSkin());
			document.getElementById("skin_model").addEventListener("change", () => reloadSkin());
			document.getElementById("cape_url").addEventListener("change", () => reloadCape());

			for (const el of document.querySelectorAll('input[type="radio"][name="back_equipment"]')) {
				el.addEventListener("change", e => {
					if (skinViewer.playerObject.backEquipment === null) {
					} else {
						skinViewer.playerObject.backEquipment = e.target.value;
					}
				});
			}

			document.getElementById("reset_all").addEventListener("click", () => {
				skinViewer.dispose();
				orbitControl.dispose();
				initializeViewer(theme);
			});
		}

		function initializeViewer(themeF) {
			skinViewer = new skinview3d.FXAASkinViewer({
				canvas: document.getElementById("skin_container"),
				alpha: false
			});
			skinViewer.renderer.setClearColor(themeF ? 0x333333 : 0xffffff);
			orbitControl = skinview3d.createOrbitControls(skinViewer);
			rotateAnimation = null;
			primaryAnimation = null;

			skinViewer.width = document.getElementById("canvas_width").value;
			skinViewer.height = document.getElementById("canvas_height").value;
			skinViewer.animations.speed = document.getElementById("global_animation_speed").value;
			if (document.getElementById("rotate_animation").checked) {
				rotateAnimation = skinViewer.animations.add(skinview3d.RotatingAnimation);
				rotateAnimation.speed = document.getElementById("rotate_animation_speed").value;
			}
			const primaryAnimationName = document.querySelector('input[type="radio"][name="primary_animation"]:checked').value;
			if (primaryAnimationName !== "") {
				primaryAnimation = skinViewer.animations.add(availableAnimations[primaryAnimationName]);
				primaryAnimation.speed = document.getElementById("primary_animation_speed").value;
			}
			orbitControl.enableRotate = document.getElementById("control_rotate").checked;
			orbitControl.enableZoom = document.getElementById("control_zoom").checked;
			orbitControl.enablePan = document.getElementById("control_pan").checked;
			for (const part of skinParts) {
				for (const layer of skinLayers) {
					skinViewer.playerObject.skin[part][layer].visible =
						document.querySelector(`#layers_table input[type="checkbox"][data-part="${part}"][data-layer="${layer}"]`).checked;
				}
			}
			reloadSkin();
			reloadCape();
		}

		initializeControls();
		initializeViewer(theme);
	</script>

	<script type="module" src="https://unpkg.com/stats.js@0.17.0/src/Stats.js" integrity="sha384-W71K+d2HbqXqQWSj3Vj4RDsIVvIV7lR8O6RArKAiqB39ntwLci0W08qOn4Z1n8sM" crossorigin="anonymous" async></script>
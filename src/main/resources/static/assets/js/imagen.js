var cargarFoto = function(event, id, cropper) {
	
    var output = $(".cropper-view-box img");
    if(event != null && event.target != null){
    	output.src = URL.createObjectURL(event.target.files[0]);
        output.onload = function() {
          URL.revokeObjectURL(output.src) 
        }
        
        if(cropper){
        	$('#img'+id).cropper({
        	      viewMode: 1,
        	      aspectRatio: 4/4,
        	      autoCropArea: 0.95,
        	      restore: false,
        	      zoomOnWheel: false
        	  });
        }
    }
  };
  
  window.addEventListener('DOMContentLoaded', function () {
      var avatar = document.getElementById('avatar');
      var image = document.getElementById('image');
      var input = document.getElementById('foto');
      var $progress = $('.progress');
      var $progressBar = $('.progress-bar');
      var $alert = $('.alert');
      var $modal = $('#modal');
      var cropper;

      $('[data-toggle="tooltip"]').tooltip();

      input.addEventListener('change', function (e) {
        var files = e.target.files;
        var done = function (url) {
          input.value = '';
          image.src = url;
          $alert.hide();
          $modal.modal('show');
        };
        var reader;
        var file;
        var url;

        if (files && files.length > 0) {
          file = files[0];

          if (URL) {
            done(URL.createObjectURL(file));
          } else if (FileReader) {
            reader = new FileReader();
            reader.onload = function (e) {
              done(reader.result);
            };
            reader.readAsDataURL(file);
          }
        }
      });

      $modal.on('shown.bs.modal', function () {
    	 cropper = new Cropper(image, {
 	        viewMode: 1,
	        aspectRatio: 4/4,
	        autoCropArea: 0.75,
	        restore: false,
	        zoomOnWheel: false
	    });

    	 
      }).on('hidden.bs.modal', function () {
        cropper["destroy"]();
        cropper = null;
      });

      document.getElementById('crop').addEventListener('click', function () {
        var initialAvatarURL;
        var canvas;

        $modal.modal('hide');

        if (cropper) {
        	
        	
        	
          canvas = cropper["getCroppedCanvas"]({
            width: 200,
            height: 200,
          });
          initialAvatarURL = avatar.src;
          avatar.src = canvas.toDataURL();
          
          $("#imagen").val(canvas.toDataURL());
          
          $progress.show();
          $alert.removeClass('alert-success alert-warning');
          canvas.toBlob(function (blob) {
            var formData = new FormData();

            formData.append('avatar', blob, 'avatar.jpg');
           
          });
        }
      });
    });

  
  
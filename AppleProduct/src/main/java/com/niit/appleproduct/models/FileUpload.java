package com.niit.appleproduct.models;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import org.springframework.web.multipart.MultipartFile;

public class FileUpload {
	public static void upload(String path, MultipartFile image, String name) {
		if (!image.isEmpty()) {
			InputStream is = null;
			OutputStream os = null;
			if (image.getSize() > 0) {
				try {
					is = image.getInputStream();
					os = new FileOutputStream(path + name);
					int b = 0;
					byte[] buffer = new byte[1024];
					while ((b = is.read(buffer, 0, 1024)) != -1) {
						os.write(buffer, 0, b);
					}
				}

				catch (Exception e) {
					e.printStackTrace();
				} finally {

					try {
						os.close();
						is.close();

					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
	}
}

package com.lightmanagement.app.util;

import java.io.*;
import java.nio.file.*;

public class DBUtils {
	
	    public static void copyDatabaseIfNotExists() throws IOException {
	        // Ruta del archivoDB
	        Path dbPath = Paths.get(System.getProperty("user.home"), "miApp", "miBaseDeDatos.db");

	        if (!Files.exists(dbPath)) {
	            // Crear directorio si no existe
	            Files.createDirectories(dbPath.getParent());

	            // Copiar el archivo DB desde resources a la ruta dbPath
	            try (InputStream is = DBUtils.class.getResourceAsStream("/data/miBaseDeDatos.db")) {
	                if (is == null) throw new FileNotFoundException("No se encontró la base de datos en recursos");

	                Files.copy(is, dbPath);
	            }
	        }
	    }

	    public static String getDatabasePath() {
	        return Paths.get(System.getProperty("user.home"), "miApp", "miBaseDeDatos.db").toString();
	    }
	}


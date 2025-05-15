module gestorInventario1 {
	exports com.lightmanagement.app.util;
	exports com.lightmanagement.app.controller;
	exports com.lightmanagement.app.model;

	requires itextpdf;
	requires java.sql;
	requires javafx.base;
	requires javafx.controls;
	requires javafx.fxml;
	requires transitive javafx.graphics;
	
	opens com.lightmanagement.app.controller to javafx.fxml;
	exports com.lightmanagement.app;
	
}
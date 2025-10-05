package DemoBlazer.utils;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.commons.io.FileUtils;

import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;

public class Report {

    public static File createFolder(String folderPath, String folderName) {
        File file = new File(folderPath + folderName);
        if (file.mkdir()) {
            System.out.println("Folder created: " + folderName);
        } else {
            System.out.println("Folder already exists: " + folderName);
        }
        return file;
    }

    public static void generateReport(String reportPath, String reportFolder, String projectName) {
        Collection<File> jsonFiles = FileUtils.listFiles(new File(reportPath), new String[] { "json" }, true);
        List<String> jsonPaths = new ArrayList<>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        
        File reportDirectory = createFolder(reportFolder, "");
        Configuration config = new Configuration(reportDirectory, projectName);
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }
}

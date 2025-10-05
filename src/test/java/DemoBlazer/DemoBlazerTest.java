package DemoBlazer;


import static org.junit.jupiter.api.Assertions.assertEquals;

import java.io.File;

import org.junit.jupiter.api.Test;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;

import DemoBlazer.utils.Report;

class DemoBlazerTest {

    String TARGET_FOLDER = "target/";
    String REPORT_FOLDER = TARGET_FOLDER + "report/";
    String PROJECT_NAME = "DemoBlazer";

    @Test
    void testParallel() throws Exception {
        String tag = System.getProperty("tag", "@demoBlazeCsv,@demoBlazeJson,@demoBlazeE2E");
        System.out.println("Tag: " + tag);
        
        File reportFolder = Report.createFolder(REPORT_FOLDER, "karate-report");        
        Results results = Runner.path("classpath:" + PROJECT_NAME)
                            .backupReportDir(false)
                            .outputCucumberJson(true)
                            .tags(tag)
                            .reportDir(reportFolder.getAbsolutePath())
                            .parallel(5);
        Report.generateReport(results.getReportDir(), REPORT_FOLDER, PROJECT_NAME);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

}
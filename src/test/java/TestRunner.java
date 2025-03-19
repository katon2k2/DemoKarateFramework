import com.intuit.karate.junit5.Karate;

class TestRunner {
    @Karate.Test
    Karate testRunner() {
        return Karate.run(
                "api/ApiRegisterTest",
                "api/ApiLoginTest",
                "api/ApiShowInfoTest",
                "api/ApiUpdateInfoTest",
                "api/ApiDeleteInfoTest",
                "web/RegisterPageTest",
                "web/LoginPageTest",
                "web/ShowInfoPageTest",
                "web/UpdateInfoPageTest"
        ).relativeTo(getClass());
    }
}
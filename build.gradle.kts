plugins {
    id("java")
}

group = "org.example"
version = "1.0-SNAPSHOT"

repositories {
    mavenCentral()
}

dependencies {
    testImplementation(platform("org.junit:junit-bom:5.10.0"))
    testImplementation("org.junit.jupiter:junit-jupiter")
    testImplementation("org.junit.jupiter:junit-jupiter")
    implementation("com.github.tomakehurst:wiremock-jre8-standalone:2.35.0")



}

tasks.test {
    useJUnitPlatform()
}
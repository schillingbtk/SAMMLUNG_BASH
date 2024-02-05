// Thomas Schilling 2024
// Share Kapazitaetsanzeige
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void getDiskSpace(const char *path) {
    char command[256];
    //  bedeutet depth = 1 eventuell erhoehen
    snprintf(command, sizeof(command), "df -kP %s/* 2>/dev/null | tail -n +2 | awk '!seen[$NF]++' | awk '{ total += $2; available += $4 } END { if (NR > 0) printf \"%%lu %%lu\\n\", total, available; else printf \"0 0\\n\"}'", path);

    FILE *dfOutput = popen(command, "r");
    if (dfOutput == NULL) {
        perror("Fehler beim Ausführen von df");
        exit(EXIT_FAILURE);
    }

    unsigned long total = 0, available = 0;
    char line[256];

    if (fgets(line, sizeof(line), dfOutput) != NULL) {
        sscanf(line, "%lu %lu", &total, &available);
    }

    printf("%lu %lu\n", total, available);

    pclose(dfOutput);
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Verwendung: %s <Pfad zum Share>\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    const char *sharePath = argv[1];
    getDiskSpace(sharePath);

    return 0;
}


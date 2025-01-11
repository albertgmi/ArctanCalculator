#include <stdio.h>

extern float _calculate_arctan(float value, int places);

float calculate_arctan(float value, int places);

int main()
{
    float myValue, result;
    int rounding;
    char buffer[256];
    printf("\nProgram calculating the value of arctg(x) and rounding it to the chosen number of decimal places");
    while (1)
    {
        printf("\nEnter x: ");
        if (scanf("%f", &myValue) == 1)
        {
            break;
        }
        else
        {
            printf("\nEnter a valid real number\n");
            while (getchar() != '\n');
        }
    }

    while (1)
    {
        printf("\nEnter rounding - an integer in the range [0;6] (FPU range): ");

        if (scanf("%d", &rounding) == 1 && rounding >= 0 && rounding <= 6)
        {
            // Check if the input is an integer
            if (fgets(buffer, sizeof(buffer), stdin) != NULL && buffer[0] != '\n')
            {
                printf("\nInvalid input. Please enter an integer.\n");
                continue;
            }
            break;
        }
        else
        {
            printf("\nEnter an integer in the range 0-6\n");
            while (getchar() != '\n');
        }
    }

    result = calculate_arctan(myValue, rounding);
    printf("arctan(%f) = %f\n", myValue, result);

    return 0;
}

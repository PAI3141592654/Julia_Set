#include <stdint.h>
#include <stdio.h>
#include <math.h>
#include "svpng.h"	//该文件引用自https://github.com/miloyip/svpng，用于生成png文件

double julia(double x,double y,double cx,double cy,int N){
    int i,j;
    double m=x,n=y,mt=x,nt=y;
    for(i=0;i<128;i++){
        m=x;n=y;mt=x;nt=y;
    	for(j=1;j<N;j++){
    	    m=x*mt-y*nt;
    	    n=x*nt+y*mt;
    	    mt=m,nt=n;
    	}
    	x=m+cx;y=n+cy;
    	if(x*x+y*y>4) return 255-i*2;
    }
    return 0;
}

uint8_t data[1024 * 1536 * 3];
int main(void) {
    double cx,cy;
    int N;
    printf("输入n，cx，cy，中间用空格分隔，系统将输出Z_{n,c}的图像\n（注：n=2时是通常意义下的朱利亚集合）\n>>>");
    scanf("%d %lf %lf",&N,&cx,&cy);
    uint8_t* p = data;
    for(int i = 0; i < 1024; ++i) {
        for(int j = 0; j < 1536; ++j) {
            uint8_t n = julia(j / 512.0 - 1.5, i / 512.0 - 1, cx, cy,N) ;
            *p++ = 255-n; *p++ = 255-2*n; *p++ = -1.5*n;
        }
    }
    FILE* file = fopen("Julia_Set.png", "wb");
    svpng(file, 1536, 1024, data, 0);
    fclose(file);
}

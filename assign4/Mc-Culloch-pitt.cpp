/// Mc-Culloch-pitt training model for logical gates ( and, or, nand ,and-not) 

#include<bits/stdc++.h>
using namespace std;
#define N 3                             /// number of inputs 
#define M 1<<N                          /// trained for all possible N bit combinations
#define MAX_EPOCH_COUNT 10000             
#define alpha .01
#define threshold 0.5

int X[M][N],Y[M];
float w[N];


void gen_data(){
    for(int i=0;i<M;i++){
        for(int j=0;j<N;j++)
            X[i][j]=i>>j&1;
    }
}
void initialize_output(string s){    
    for(int i=0;i<M;i++){
        int cnt=0;
        for(int j=0;j<N;j++)cnt+=X[i][j]==1;
        if(s=="and"){
            Y[i]=cnt==N;
        }
        else if(s=="or"){
            Y[i]=cnt>0;
        }
        else if(s=="nand"){
            Y[i]=!(cnt==N);
        }
        else if(s=="and-not"){
            assert(N==2);
            Y[i]=X[i][0]&!X[i][1];
        }
        
    }
}
void initialize_weights(){
    for(int i=0;i<N;i++)
        w[i]=rand()/RAND_MAX;
}

// backward and forward propagation
namespace network
{
    int forward_prop(int m){
        float s=0;
        for(int i=0;i<N;i++){
            s+=w[i]*X[m][i];
        }
        return s>threshold;
    }
    void backward_prop(int m,int del){
        for(int i=0;i<N;i++){
            w[i]+= alpha*del*X[m][i];
        }
    }
};


void print_result(int m){
    for(int i=0;i<N;i++)cout<<X[m][i]<<" ";
    cout << network::forward_prop(m) << "\n";
}

int main(int argc,char **argv){
    gen_data();
    initialize_weights();
    initialize_output(argv[1]);
    
    for(int epoch=0;epoch<MAX_EPOCH_COUNT;epoch++){
        float loss=0;
        for(int i=0;i<M;i++){
            int s = network::forward_prop(i);
            int del=Y[i]-s;
            loss+=abs(del);
            network::backward_prop(i,del);            
        }
        if(loss==0){
            cout<<"Epochs required:- "<<epoch<<"\n";
            string x(2*N-2,' ');
            cout<<" X"<<x<<"Y"<<"\n";
            for(int i=0;i<M;i++){
                print_result(i);
            }
            break;
        }
    }    
}


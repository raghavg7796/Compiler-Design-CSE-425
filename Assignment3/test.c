int fact(int n){
	int ans=1;
	int i;
	for(int i=1;i<=n;i+=1){
		ans*=i;
	}
	return(ans);
}
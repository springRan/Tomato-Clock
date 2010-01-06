//
//  Tomatoview.m
//  TomatoClock
//
//  Created by GangeyaKumar on 23/12/09.
//  Copyright 2009 Sedin. All rights reserved.
//

#import "Tomatoview.h"
#import"stdlib.h"
//#import <sqlite3.h>
#import<AudioToolbox/AudioServices.h>
#import"TomatoClockAppDelegate.h"
//#import "TomatoList.h"

@implementation Tomatoview

@synthesize lbltimer,btnpause,btnstart,timer,clappingFileID,btnreset,btnplay,clappingFileID1,tomatoarray,mydate
,comments,tomatoapp,window,selected,txtfld1,timer1,timer2,timer3,timer10,timer11,imageview1,btncheck,btncheck1;


BOOL isTimerTicking = TRUE;
BOOL isPlayaudio1 =TRUE;
BOOL isPlayaudio2 =TRUE;
BOOL isStart = TRUE;
int numTimerTicks=6;
int a=10;
int times;
int id1=1,count1=10;
BOOL isCount=FALSE;
BOOL isCount1=FALSE;
BOOL issecondplay=FALSE;
BOOL checked =FALSE;
BOOL loop =FALSE;

/*
// Override initWithNibName:bundle: to load the view using a nib file then perform additional customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically.
- (void)loadView {
}
*/
- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate
	//printf("Terminate");
	//sqlite3_close(tomato_db);
}


// Implement viewDidLoad to do additional setup after loading the view.
- (void)viewDidLoad {
	
	//[self ontimer];
	//[self updateLabel];
   
	[super viewDidLoad];
	
	}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
    [super dealloc];
}




-(void)awakeFromNib {
	
lbltimer.text=@"00";
	
}

//To display check box
-(IBAction) check
{   
	btncheck.hidden=TRUE;
	btncheck1.hidden =FALSE;
	checked = TRUE;
	
}
   

//To display check box
-(IBAction) uncheck
{
	checked = FALSE;
	btncheck.hidden =FALSE;
	btncheck1.hidden =TRUE;
	
}




//Start button pressed
//increment the timer
- (IBAction)start {
	UIImage* img1 = [UIImage imageNamed:@"Meet.png"];
	imageview1.image=img1;
	
	isPlayaudio1 =TRUE;
	issecondplay=FALSE;
	printf("start............. \n");
	btnstart.hidden =TRUE;
	btnreset.hidden =FALSE;
	
	if(isTimerTicking)
	{	
		printf("Timer Tick");
		if(isCount==FALSE)
		{
		[timer2 invalidate];
		//[timer3 invalidate];
        }
			
		times = 25.0;
		timer = [NSTimer scheduledTimerWithTimeInterval: 1.0 target: self selector:@selector (countDown) userInfo:nil repeats:YES];
		//timer1 = [NSTimer scheduledTimerWithTimeInterval: 1.0 target: self selector:@selector (ontimer) userInfo:nil repeats:YES];
		
		
		
	}
	
    
}






/*-(void) ontimer
{      printf("\n........ontimer \n");
	if(isTimerTicking)
	{	
		printf("ontimer");
		
		detailsTimeFormatter = [[NSDateFormatter alloc] init];
		//[detailsTimeFormatter setDateStyle:NSDateFormatterMediumStyle];
		[detailsTimeFormatter setTimeStyle:NSDateFormatterMediumStyle];
	}	
}	



-(void) ontimer1
{      printf("\n........ontimer1 \n");
	if(isTimerTicking)
	{	
		printf("ontimer1");
		
		detailsTimeFormatter = [[NSDateFormatter alloc] init];
		//[detailsTimeFormatter setDateStyle:NSDateFormatterMediumStyle];
		[detailsTimeFormatter setTimeStyle:NSDateFormatterMediumStyle];
	}	
}	
*/


//increment the timer
//Reset button pressed
- (IBAction)reset {
	//Set the count in the textfield
	printf("Reset");
	UIImage* img1 = [UIImage imageNamed:@"Meet.png"];
	imageview1.image=img1;
	
	isTimerTicking =FALSE;
	btnstart.hidden =FALSE;
	btnreset.hidden =TRUE;
	//Playing audio
	isPlayaudio1 =TRUE;
	isTimerTicking=TRUE;
	issecondplay == TRUE;
	printf("Reset1111111111");	
	if (issecondplay == TRUE)
	{
		printf("issecondplay");	
		//[timer10 invalidate];
		
	}
	printf("Rest...........\n");
	
	if(isTimerTicking)
	{	
		
		printf("isTimerTicking");
		if(isCount1==FALSE)
	{
		printf("isCount1");
		[timer invalidate];
		[timer1 invalidate];
	}
		printf("Restsssssss...........\n");
		if(loop == TRUE)
		{	
		  times = 25.0;
			
		}
		else
		{
			times=26.0;	
		}
		//[timer invalidate];
		//[timer1 invalidate];
		timer2 = [NSTimer scheduledTimerWithTimeInterval: 1.0 target: self selector:@selector (countDowns) userInfo:nil repeats:YES];
		//timer3 = [NSTimer scheduledTimerWithTimeInterval: 1.0 target: self selector:@selector (ontimer1) userInfo:nil repeats:YES];
	}
	
}


-(void)countDown {
	printf("countDownnnnnnnnnnnnn");
	printf("times =%d",times);
	times = times - 1;
	if (times == -1) {
		isCount1 = TRUE;
        if (issecondplay == TRUE)
		{
			[timer11 invalidate];
			
		}
		else
		{	
		
		[timer invalidate];
		//[timer1 invalidate];
		}
		[self playaudio1];
	}
	if(times >=0)
	{	
	[self updateLabel];
	}
}



//Reset calls
-(void)countDowns {
	printf("countDownsssssssssss");
	printf("times =%d",times);
	
	times = times - 1;
	if (times == -1) {
		isCount =TRUE;
		
		[timer2 invalidate];
		//[timer3 invalidate];
		
		[self playaudios];
	}
	if(times>=0)
	{	
		[self updateLabel];
	}	
	
}


-(void) play2 {
	printf("play222222222222222.......\n");
	printf("times =%d",times);
	times = times - 1;
	if (times == -1) {
		isCount =TRUE;
		
		//sleep(7);
		[timer10 invalidate];
		/*[timer2 invalidate];
		[timer3 invalidate];*/
		
		[self playaudio2];
	}
	if(times>=0 && issecondplay == TRUE)
	{	
		[self updateLabel];
	}	
	
}




-(void) play1{
	printf("play11111111111111111111 \n");
	printf("times =%d",times);
	times = times - 1;
	if (times == -1) {
		isCount =TRUE;
		printf("I am inside of play1111111111111");
		//sleep(7);
		[timer11 invalidate];
		/*[timer2 invalidate];
		 [timer3 invalidate];*/
		
		[self playaudio1];
	}
	if(times>=0 && issecondplay == TRUE)
	{	
		[self updateLabel];
	}	
	
}




//Set the value to the label
-(void) updateLabel {
	if(times>=10)
	{
	lbltimer.text = [NSString stringWithFormat:@"%i" , times];
	}
	else
	{
	 lbltimer.text = [NSString stringWithFormat:"0"@"%i" , times];
		
	}	
	//lbltimer.text =[[detailsTimeFormatter stringFromDate:[NSDate date]] lowercaseString];
}


-(void) playaudio1
{
	printf("playaudio1");
	lbltimer.text = @"00";
	isPlayaudio1 =TRUE;
	isPlayaudio2=FALSE;
	NSString *clapPath = [[NSBundle mainBundle] pathForResource:@"clapping-crowd-studio-01" ofType:@"caf"];
	CFURLRef clapURL = (CFURLRef ) [NSURL fileURLWithPath:clapPath];
	AudioServicesCreateSystemSoundID (clapURL, &clappingFileID);
	AudioServicesPlaySystemSound(clappingFileID);
	[self mytime];
}	


-(void) playaudios
{
	printf("playaudios");
	isPlayaudio1 =FALSE;
	isPlayaudio2=TRUE;
	NSString *clapPath = [[NSBundle mainBundle] pathForResource:@"clapping-crowd-studio-01" ofType:@"caf"];
	CFURLRef clapURL = (CFURLRef ) [NSURL fileURLWithPath:clapPath];
	AudioServicesCreateSystemSoundID (clapURL, &clappingFileID);
	AudioServicesPlaySystemSound(clappingFileID);
	//sleep(5);
	[self mytime];	
}	

-(void) playaudio2
{
	printf("playaudios");
	isPlayaudio1 =FALSE;
	isPlayaudio2=TRUE;
	NSString *clapPath = [[NSBundle mainBundle] pathForResource:@"Start" ofType:@"caf"];
	CFURLRef clapURL = (CFURLRef ) [NSURL fileURLWithPath:clapPath];
	AudioServicesCreateSystemSoundID (clapURL, &clappingFileID);
	AudioServicesPlaySystemSound(clappingFileID);
	
	if(checked == TRUE)
	{	
	 sleep(5);	
	 loop =TRUE;	
	 [self reset];
	}	
	else
	{
		UIImage* img1 = [UIImage imageNamed:@"End.png"];
		imageview1.image=img1;
	
	}
}	




//Play and Pause


-(IBAction) pause

{
	
	btnplay.hidden =FALSE;
	btnpause.hidden =TRUE;
	[timer invalidate];
	[timer2 invalidate];
	isTimerTicking =FALSE;
	if(isPlayaudio1 == TRUE)
	{	
		
		AudioServicesDisposeSystemSoundID(clappingFileID);
	}
	
	
	
}	

-(IBAction) play

{
	
	btnplay.hidden =TRUE;
	btnpause.hidden =FALSE;
	isTimerTicking =TRUE;
	//NSString *mylbl = lbltimer.text;
	//NSNumber *times1 = [NSNumber numberWithInt:mylbl];
	
	//printf("Times1 = %i",times1);
	
	printf("\n times..........=%i\n",times);
	if(isPlayaudio1 == TRUE)
	{	
	timer = [NSTimer scheduledTimerWithTimeInterval: 1.0 target: self selector:@selector (countDown) userInfo:nil repeats:YES];
	}
	
	else
	{
		timer2 = [NSTimer scheduledTimerWithTimeInterval: 1.0 target: self selector:@selector (countDown1) userInfo:nil repeats:YES];
	}
}	

//Start.caf
-(void) mytime
{
	
	UIImage* img1 = [UIImage imageNamed:@"break.png"];
	imageview1.image=img1;
	printf("mytime................\n");
   issecondplay =TRUE;
  	if(isTimerTicking)
	{	 sleep(5);
		printf("Inside of mytime");
		times = 5.0;
		timer10 = [NSTimer scheduledTimerWithTimeInterval: 1.0 target: self selector:@selector (play2) userInfo:nil repeats:YES];
	}	
}


//Clap.caf
-(void) mytimes
{
	printf("mytime................\n");
	isTimerTicking =TRUE;
	//issecondplay =TRUE;
	UIImage* img1 = [UIImage imageNamed:@"Meet.png"];
	imageview1.image=img1;
  	if(isTimerTicking)
	{	
		times = 5.0;
		timer11 = [NSTimer scheduledTimerWithTimeInterval: 1.0 target: self selector:@selector (play1) userInfo:nil repeats:YES];
	}	
}


@end
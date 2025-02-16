    %% load 
    clear;
    clc;
    load('emg_healthym.mat')
    load('emg_myopathym.mat')


    first=healthy(1:1100);
    second=val(1:1100);
       load('emg_neuropathym.mat')
    third=val(1:1100);

    %% forier 
    figure('Name','firstRepresentaion');
    forierTrans1=signalRepresentation(first);
    figure('Name','secondRepresentaion');
    forierTrans2=signalRepresentation(second);
    figure('Name','thirdRepresentaion');
    forierTrans3=signalRepresentation(third);

    %% filter 
    figure('Name','firstfilteration');
    FILTERED1f =  butterfilter(first);
    FILTERED2f =  chebyshevFilter(FILTERED1f);
    FILTERED3f=  firFilter(FILTERED2f);
    FILTERED4f=  notchFilter(FILTERED3f) ;
    
    figure('Name','secondfilteration');
    FILTERED1s =  butterfilter(second);
    FILTERED2s =  chebyshevFilter(FILTERED1s);
    FILTERED3s=  firFilter(FILTERED2s);
    FILTERED4s=  notchFilter(FILTERED3s) ; 

    figure('Name','thirdfilteration');
    FILTERED1t =  butterfilter(third);
    FILTERED2t =  chebyshevFilter(FILTERED1t);
    FILTERED3t=  firFilter(FILTERED2t);
    FILTERED4t=  notchFilter(FILTERED3t) ;

    %% analysis
     figure('Name','first');
    [mean1f, med1f, var1f, mean2f, med2f, var2f] = aianalysisi(first,FILTERED2f);
%     [mean1,med1,var1] = analysissss(FILTERED2f);
     figure('Name','second');
    [means, med1s, var1s, mean2s, med2s, var2s] = aianalysisi(second,FILTERED2s);
%     [mean1,med1,var1] = analysissss(FILTERED2s);
     figure('Name','third');
    [mean1t, med1t, var1t, mean2t, med2t, var2t] = aianalysisi(third,FILTERED2t);
%     [mean1,med1,var1] = analysissss(FILTERED2t);


    %% 
    
%     signalClassification(Book1,first)
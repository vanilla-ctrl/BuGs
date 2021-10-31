#!/usr/bin/python
print ("Starting Recon")
print ("Tools- findomain,subfinder,assetfinder,amass actve and passive,sublist3r")
from subprocess import Popen, PIPE
import sys



domain = sys.argv[1]
commands = [ 'findomain -t '+domain+' -u '+domain+'_findomain.txt ;subfinder -d '+domain+' -t 100 -o '+domain+'_subfinder.txt ;assetfinder --subs-only '+domain+' >> '+domain+'_assetfinder.txt; amass enum -d '+domain+' -o '+domain+'_amass.txt ; python /home/kali/subbrute/subbrute.py '+domain+' -o '+domain+'_subbrute.txt ; amass enum --passive -d '+domain+' -config /home/sayeed/config.ini -o '+domain+'_amass_passive.txt;amass enum  -src -ip -brute -config /home/sayeed/config.ini -min-for-recursive 2 -d '+domain+' -o '+domain+'_amass_passive.txt; sublist3r -d '+domain+' -o '+domain+'_sublist3r.txt ;gauplus -t 5 -random-agent -subs '+domain+' |  unfurl -u domains | anew '+domain+'_gauplus.txt ;waybackurls '+domain+' |  unfurl -u domains | tee -a '+domain+'_waybaclurls.txt ;github-subdomains -d '+domain+' -t /home/sayeed/tokens.txt -o '+domain+'_githubsubdomins.txt ;crobat -s '+domain+' >> '+domain+'_crobat.txt ;cat *.txt | sort -u >> '+domain+'_final_domains.txt ;cat '+domain+'_final_domains.txt | httpx | sort -u >> valid_subs.txt;']
count = 0  
processes = []
for com in commands:
    print ("Recon Started...............")
    processes.append(Popen(com, shell=True))
    count += 1
    print ("[OK] command "+str(count)+" running successfully.")
else:
    print ("Recon Finished")

for i, process in enumerate(processes):
    process.wait()
    print ("Command #{} finished".format(i))

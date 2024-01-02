# common aliases for stuff.
alias screen='screen -U'
# this is the only game i use :)
alias fortune=/usr/games/fortune

#for adding dates wherever i want.
alias today='date +%Y-%m-%d'

# authenticated curl against GCF:
alias gcurl='curl  -H "Authorization: bearer $(gcloud auth print-identity-token)"'

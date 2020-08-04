#!/usr/bin/python

import libvirt, sys, math

conn = libvirt.openReadOnly("qemu:///system")

if conn == None:
    print("Une erreur est survenue, impossible de seconnnecter à l'hyperviseur !")
    sys.exit(1)
    
def GetState(state, reason):
	if state == libvirt.VIR_DOMAIN_NOSTATE:
		return 'Pas d\'état'
	elif state == libvirt.VIR_DOMAIN_RUNNING:
		return 'En cours'
	elif state == libvirt.VIR_DOMAIN_BLOCKED:
		return 'Bloqué'
	elif state == libvirt.VIR_DOMAIN_PAUSED:
		return 'En pause'
	elif state == libvirt.VIR_DOMAIN_SHUTDOWN:
		return 'Arrêt'
	elif state == libvirt.VIR_DOMAIN_SHUTOFF:
		return 'Eteint'
	elif state == libvirt.VIR_DOMAIN_CRASHED:
		return 'Crash'
	elif state == libvirt.VIR_DOMAIN_PMSUSPENDED:
		return 'Suspendue'
	else:
		return 'Etat inconnue'
	return reason
		
domains = conn.listAllDomains(0)

if len(domains) != 0:
	for domain in domains:
		print(" Nom: %s" % domain.name())
		state,reason = domain.state()
		print(" Etat: %s\n" % GetState(state, reason))
conn.close()

	

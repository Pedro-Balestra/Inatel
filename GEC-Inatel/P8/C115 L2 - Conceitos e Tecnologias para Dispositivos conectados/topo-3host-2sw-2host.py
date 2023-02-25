from mininet.topo import Topo

class MyTopo( Topo ):
    "3 host 2 switch 2 host custom topology"

    def __init__( self ):
        "Create custom topo."

        # Initialize topology
        Topo.__init__( self )

        # Add hosts and switches
        leftHost = self.addHost( 'h1' )
        leftHost1a=self.addHost('h1a')
        leftHost1b=self.addHost('h1b')
        rightHost = self.addHost( 'h2' )
        rightHost2a = self.addHost( 'h2a' )
        leftSwitch = self.addSwitch( 's3' )
        rightSwitch = self.addSwitch( 's4' )

        # Add links
        self.addLink( leftHost, leftSwitch )
        self.addLink( leftHost1a, leftSwitch )
        self.addLink( leftHost1b, leftSwitch )
        self.addLink( rightHost, rightSwitch )
        self.addLink( leftHost2a, rightSwitch )
        self.addLink( leftSwitch, rightSwitch )

topos = { 'mytopo': ( lambda: MyTopo() ) }
